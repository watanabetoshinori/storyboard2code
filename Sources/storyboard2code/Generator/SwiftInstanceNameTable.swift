//
//  SwiftInstanceNameTable.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/19/18.
//

import Foundation
import StoryboardModel

class SwiftInstanceNameTable: NSObject {
    
    struct NameRecord {
        var id: String
        var type: String
        var name: String
    }
    
    var records = [NameRecord]()
    
    var rootViews = [View]()
    
    // MARK: - Initializing a Singleton
    
    static let shared = SwiftInstanceNameTable()
    
    override private init() {
        
    }
    
    // MARK: - Get instance name for ID
    
    func getName(for id: String) -> String? {
        return records.first(where: { $0.id == id })?.name
    }
    
    // MARK: - Generate instance name for object
    
    func generateName(for id: String, view: View) -> String {
        let isRootView = (rootViews.first(where: { $0.id == id }) != nil)

        let type: String = {
            if isRootView == false,
                let customClass = view.customClass {
                return customClass
            }
            return SwiftCodeExtension.getClassName(for: view)
        }()

        let name = registerRecord(for: id, type: type, autoIncrement: isRootView == false)

        // Save SaveArea ViewLayoutGuide
        if let layoutGuide = view.viewLayoutGuide,
            layoutGuide.key == "safeArea" {

            let record = NameRecord(id: layoutGuide.id,
                                    type: "ViewLayoutGuide",
                                    name: name + ".safeAreaLayoutGuide")
            records.append(record)
        }
        
        return name
    }
    
    func generateName(for id: String, object: Any) -> String {
        let type = SwiftCodeExtension.getClassName(for: object)
        return registerRecord(for: id, type: type)
    }
    
    // MARK: - Register Name record
    
    private func registerRecord(for id: String, type: String, autoIncrement: Bool = true) -> String {
        let lowerType: String = {
            if let first = type.first {
                return String(first).lowercased() + type.dropFirst()
            }
            return type
        }()
        
        let name: String = {
            if autoIncrement {
                let sameTypeRecords = records.filter({ $0.type == type })
                if sameTypeRecords.count > 0 {
                    return lowerType + "\(sameTypeRecords.count + 1)"
                }
            }
            return lowerType
        }()
        
        let record = NameRecord(id: id, type: type, name: name)
        records.append(record)
        
        return record.name
    }
    
}
