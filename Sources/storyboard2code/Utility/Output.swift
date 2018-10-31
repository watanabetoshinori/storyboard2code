//
//  Output.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/28/18.
//

import Foundation

public func log(_ message: String) {
    print("[\(Date().time)]: " + "\(message)".green)
}

public func info(_ message: String) {
    print("[\(Date().time)]: " + "\(message)".white)
}

public func error(_ message: String) {
    print("[\(Date().time)]: " + "\(message)".red)
}

public func step(_ name: String) {
    let hyphen = String(repeating: "-", count: name.count)
    log("----------\(hyphen)----")
    log("--- Step: \(name) ---")
    log("----------\(hyphen)----")
}

extension Date {
    
    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()
    
    var time: String {
        return Date.timeFormatter.string(from: self)
    }
    
}
