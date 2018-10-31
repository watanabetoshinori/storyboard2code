import Foundation
import Commander
import XMLParsing
import StoryboardModel

let main = command(Argument<String>("filename", description: "The storyboard file"),
                   Option("output", default: "storyboard2code.swift", description: "The output file name"),
                   Option("codegen", default: "class", description: "The code generation type (class or extension)")
) { filename, output, codegen in
    
    log("=======================")
    log("    storyboard2code    ")
    log("=======================")

    do {
        if filename.isEmpty {
            throw Storyboard2CodeError.invalidArgument("filename is empty")
        }

        guard let codegenType = CodeGenType(rawValue: codegen) else {
            throw Storyboard2CodeError.invalidArgument("codegen should be `class` or `extension`")
        }
        
        info("Arguments")
        info("  filename: \(filename)")
        info("Options")
        info("  --output: \(output)")
        info("  --codegen: \(codegenType.rawValue)")

        // Convert storyboard XML to model
        step("convert_storyboard_to_model")

        let url = URL(fileURLWithPath: filename)
        let xml = try String(contentsOf: url)
        
        guard let data = xml.data(using: .utf8) else {
            throw Storyboard2CodeError.storyboardConvertFailed
        }
        
        let document = try XMLDecoder().decode(Document.self, from: data)
        
        // Generate swift code from model
        step("generate_swift_code")
        
        let code = SwiftCodeGenerator(document: document, codegen: codegenType).generate()

        // Write swift code to file
        step("write_code_to_file")

        let outputURL = url.deletingLastPathComponent().appendingPathComponent(output)
        try code.write(to: outputURL, atomically: true, encoding: .utf8)

        info("Successfully write to file.")
        info(outputURL.absoluteString)

        log("storyboard2code finished successfully 🎉")

    } catch let e {
        error("storyboard2code finished with errors")
        error("[!] \(e.localizedDescription)")
    }
}

main.run()
