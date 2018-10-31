//
//  String+Color.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/25/18.
//

import Foundation

extension String {
    
    var black: String {
        return "\u{001B}[0;30m\(self)\u{001B}[0;0m"
    }
    
    var red: String {
        return "\u{001B}[0;31m\(self)\u{001B}[0;0m"
    }
    
    var green: String {
        return "\u{001B}[0;32m\(self)\u{001B}[0;0m"
    }
    
    var yellow: String {
        return "\u{001B}[0;33m\(self)\u{001B}[0;0m"
    }
    
    var blue: String {
        return "\u{001B}[0;34m\(self)\u{001B}[0;0m"
    }
    
    var magenta: String {
        return "\u{001B}[0;35m\(self)\u{001B}[0;0m"
    }
    
    var cyan: String {
        return "\u{001B}[0;36m\(self)\u{001B}[0;0m"
    }
    
    var white: String {
        return "\u{001B}[0;37m\(self)\u{001B}[0;0m"
    }
    
}
