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
        let type: String = {
            if let customClass = view.customClass {
                return customClass
            }
            return SwiftCodeExtension.getClassName(for: view)
        }()

        let name = registerRecord(for: id, type: type)

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
    
    private func registerRecord(for id: String, type: String) -> String {
        let lowerType: String = {
            if let first = type.first {
                return String(first).lowercased() + type.dropFirst()
            }
            return type
        }()
        
        let sameTypeRecords = records.filter({ $0.type == type })
        let name: String = {
            if sameTypeRecords.count == 0 {
                return lowerType
            }
            return lowerType + "\(sameTypeRecords.count + 1)"
        }()
        
        let record = NameRecord(id: id, type: type, name: name)
        records.append(record)
        
        return record.name
    }
    
}
