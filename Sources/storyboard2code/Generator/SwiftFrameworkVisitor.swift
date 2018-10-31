//
//  SwiftFrameworkVisitor.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/19/18.
//

import Foundation
import StoryboardModel

class SwiftFrameworkVisitor: NSObject {
    
    var frameworks = ["UIKit"]
    
    // MARK: - Visitors
    
    func visit(_ viewController: ViewController) {
        if let tc = viewController as? TableViewController {
            tc.tableView.sections?.map(visit)
            tc.tableView.prototypes?.map(visit)
        } else if let cc = viewController as? CollectionViewController {
            visit(cc.collectionView)
        } else {
            viewController.view.map(visit)
        }
    }
    
    func visit(_ section: TableViewSection) {
        section.cells?.map(visit)
    }
    
    func visit(_ cell: TableViewCell) {
        cell.tableViewCellContentView.map(visit)
    }
    
    func visit(_ view: View) {
        if let _ = view as? MapView {
            addFramework("MapKit")
        } else if let _ = view as? WkWebView {
            addFramework("WebKit")
        }
        
        view.subviews?.map(visit)
    }
    
    // MARK: - Add framework
    
    func addFramework(_ framework: String) {
        if frameworks.firstIndex(of: framework) == nil {
            frameworks.append(framework)
        }
    }
    
}
