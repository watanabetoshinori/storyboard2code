//
//  SwiftCodeExtension.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/19/18.
//

import Foundation
import Stencil
import StencilSwiftKit
import StoryboardModel

class SwiftCodeExtension: Extension {
    
    class func getClassName(for object: Any) -> String {
        return String(describing: object).components(separatedBy: ".").last ?? ""
    }

    class func `extension`() -> SwiftCodeExtension {
        let ext = SwiftCodeExtension()
        
        // Returns "import *" block
        ext.registerFilter("framework_references") { (value: Any?) in
            if let viewController = value as? ViewController {
                let visitor = SwiftFrameworkVisitor()
                visitor.visit(viewController)
                return visitor.frameworks.reduce(into: "", { $0 += "import \($1)\n" }) as Any
            }
            return "import UIKit"
        }

        // Returns type name for object (e.g. View, TableView)
        ext.registerFilter("type") { (value: Any?) in
            if let value = value {
                return getClassName(for: value)
            }
            
            return ""
        }
        
        // Returns class name for object (e.g. UIView, UITableView)
        ext.registerFilter("class") { (value: Any?) in
            if let viewController = value as? ViewController {
                let type = getClassName(for: viewController)
                return "UI" + type
                
            } else if let view = value as? View {
                if let customClass = view.customClass {
                    return customClass
                }
                
                let type = getClassName(for: view)
                if type == "ContainerView" {
                    return "UIView"
                } else if type == "MapView" {
                    return "MK" + type
                } else if type == "WkWebView" {
                    return "WKWebView"
                }
                return "UI" + type
            }
            
            return ""
        }
        
        // Returns initialize code for object
        ext.registerFilter("init") { (value: Any?) -> Any? in
            if let autoresizingMask = value as? AutoresizingMask {
                var literals = [String]()
                if autoresizingMask.flexibleMinX == "YES" {
                    literals.append(".flexibleLeftMargin")
                }
                if autoresizingMask.flexibleMaxX == "YES" {
                    literals.append(".flexibleRightMargin")
                }
                if autoresizingMask.flexibleMinY == "YES" {
                    literals.append(".flexibleTopMargin")
                }
                if autoresizingMask.flexibleMaxY == "YES" {
                    literals.append(".flexibleBottomMargin")
                }
                if autoresizingMask.heightSizable == "YES" {
                    literals.append(".flexibleHeight")
                }
                if autoresizingMask.widthSizable == "YES" {
                    literals.append(".flexibleWidth")
                }
                
                if literals.isEmpty == false {
                    return "UIView.AutoresizingMask(arrayLiteral: [" + literals.joined(separator: ", ") + "])"
                }
            }
            return nil
        }
        
        // Returns all root views for ViewController
        ext.registerFilter("rootViews") { (value: Any?) in
            if let viewController  = value as? ViewController {
                var views = [View]()
                
                if let view = viewController.view {
                    views.append(view)
                }
                
                if let collectionViewController = viewController as? CollectionViewController {
                    views.append(collectionViewController.collectionView)
                    
                } else if let navigationController = viewController as? NavigationController {
                    views.append(navigationController.navigationBar)
                    
                    if let toolBar = navigationController.toolbar {
                        views.append(toolBar)
                    }
                    
                } else if let tabBarController = viewController as? TabBarController {
                    views.append(tabBarController.tabBar)
                    
                } else if let tableViewController = viewController as? TableViewController {
                    views.append(tableViewController.tableView)
                    
                    if let refreshControl = tableViewController.refreshControl {
                        views.append(refreshControl)
                    }
                }
                
                return views
            }
            
            return nil
        }
        
        // Returns instance name for object
        ext.registerFilter("instanceName") { (value: Any?) in
            if let viewController = value as? ViewController {
                if let customClass = viewController.customClass {
                    return customClass
                }
                return getClassName(for: viewController)
                
            } else if let view = value as? View {
                let id = view.id ?? ""
                if let name = SwiftInstanceNameTable.shared.getName(for: id) {
                    return name
                }
                return SwiftInstanceNameTable.shared.generateName(for: id, view: view)

            } else if let constraint = value as? Constraint {
                let id = constraint.id
                if let name = SwiftInstanceNameTable.shared.getName(for: id) {
                    return name
                }
                return SwiftInstanceNameTable.shared.generateName(for: id, object: constraint)

            } else if let item = value as? NavigationItem {
                let id = item.id
                if let name = SwiftInstanceNameTable.shared.getName(for: id) {
                    return name
                }
                return SwiftInstanceNameTable.shared.generateName(for: id, object: item)

            } else if let gestureRecognizer = value as? TapGestureRecognizer {
                let id = gestureRecognizer.id
                if let name = SwiftInstanceNameTable.shared.getName(for: id) {
                    return name
                }
                return SwiftInstanceNameTable.shared.generateName(for: id, object: gestureRecognizer)

            } else if let id = value as? String {
                return SwiftInstanceNameTable.shared.getName(for: id)
            }
            
            return nil
        }
        
        // Returns outlet collection property names
        ext.registerFilter("outletcollection_properties") { (value: Any?) in
            if let viewController = value as? ViewController {
                if let outletCollectiosn = viewController.connections?.filter({ ($0 as? OutletCollection) != nil }) as? [OutletCollection] {
                    return outletCollectiosn.reduce(into: [String](), { (result, collection) in
                        if let property = collection.property, result.contains(property) == false {
                            result.append(property)
                        }
                    })
                }
            }
            if let view = value as? View {
                if let outletCollectiosn = view.connections?.filter({ ($0 as? OutletCollection) != nil }) as? [OutletCollection] {
                    return outletCollectiosn.reduce(into: [String](), { (result, collection) in
                        if let property = collection.property, result.contains(property) == false {
                            result.append(property)
                        }
                    })
                }
            }
            return nil
        }
        
        // Reset all state
        ext.registerFilter("reset_state") { (value: Any?) in
            SwiftInstanceNameTable.shared.records.removeAll()
            return nil
        }
        
        // Convert storyboard bool to swift bool (YES -> true)
        ext.registerFilter("swiftBool") { (value: Any?) in
            if let value = value as? String {
                if value == "YES" {
                    return true
                } else if value == "NO" {
                    return false
                }
            }
            
            return nil
        }
        
        // Convert storyboard multiplier to swift multiplier ("1:2" -> 
        ext.registerFilter("swiftMultiplier") { (value: Any?) in
            if let value = value as? String {
                if value.contains(":") {
                    return value.replacingOccurrences(of: ":", with: "/")
                }
            }
            return value ?? 1.0
        }

        return ext
    }

}
