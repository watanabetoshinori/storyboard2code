//
//  SwiftCodeGenerator.swift
//  storyboard2code
//
//  Created by Watanabe Toshinori on 11/1/18.
//

import Foundation
import Stencil
import StencilSwiftKit
import StoryboardModel

enum CodeGenType: String {
    case `class`
    case `extension`
}

class SwiftCodeGenerator: NSObject {
    
    var document: Document!
    
    var codegen: CodeGenType = .class
    
    // MARK: - Initialize
    
    init(document: Document, codegen: CodeGenType) {
        super.init()
        self.document = document
        self.codegen = codegen
    }
    
    // MARK: - Generate code
    
    func generate() -> String {
        var environment = stencilSwiftEnvironment()
        environment.extensions.append(SwiftCodeExtension.extension())

        let template = StencilSwiftTemplate(templateString: kSwiftCodeTemplate, environment: environment)
        do {
            let source = try template.render(["document": document, "codegen": codegen.rawValue])
            return source
        } catch {
            print(error.localizedDescription)
        }
        
        return ""
    }
    
}

