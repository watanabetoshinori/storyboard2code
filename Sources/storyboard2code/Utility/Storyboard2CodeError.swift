//
//  Storyboard2CodeError.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/28/18.
//

import Foundation

public enum Storyboard2CodeError: Error {
    case invalidArgument(String)
    case storyboardConvertFailed
}

extension Storyboard2CodeError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidArgument(let reason):
            return "Invalid argument: \(reason)"
        case .storyboardConvertFailed:
            return "Failed to convert storyboard."
        }
    }
    
}
