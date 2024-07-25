import Foundation

func readFileToString(filename: String) -> String {
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    let fileURL = URL(fileURLWithPath: currentPath).appendingPathComponent(filename)
    do {
        let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        return fileContents
    } 
    catch {
        print("Error reading file: \(error)")
        return ""
    }
}

func extractTodoLines(lines: [String], lang: Language) -> [String] {
    let style = determineCommentStyle(lang: lang)
    var result: [String] = []
    Loop: for line in lines {
        var temp = line
        temp = temp.trimmingCharacters(in: .whitespaces)
        switch style {
        case .cLike:
            if !temp.starts(with: "//") {
                continue Loop
            }
            else {
                //todo: handle logic
            }
        case .pyLike:
            if !temp.starts(with: "#") {
                continue Loop
            }
            else {
                //todo: handle logic
            }
        case .lua:
            if !temp.starts(with: "--") {
                continue Loop
            }
            else {
                //todo: handle logic
            }
        case .shell:
            if !temp.starts(with: ";") {
                continue Loop
            }
            else {
                //todo: handle logic
            }
        case .unknown:
            continue Loop
        }

    }
    return result
}