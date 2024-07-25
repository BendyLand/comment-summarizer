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

func indexOf(_ needle: String, in haystack: String) -> Int {
    let startChar = needle[needle.startIndex]
    Outer: for i in haystack.indices {
        if haystack[i] == startChar {
            var match = true
            var j = needle.startIndex
            var k = i
            Inner: while j < needle.endIndex && k < haystack.endIndex {
                if haystack[k] != needle[j] {
                    match = false
                    break Inner
                }
                j = needle.index(after: j)
                k = haystack.index(after: k)
            }
            if match && j == needle.endIndex {
                return haystack.distance(from: haystack.startIndex, to: i)
            }
        }
    }
    return -1
}

func extractCommentLines(_ lines: [String], lang: Language) -> [String] {
    let style = determineCommentStyle(lang: lang)
    var result: [String] = []
    for line in lines {
        if line.contains(style.rawValue) {
            result.append(line)
        }
    }
    return result
}

func extractComment(_ line: String, delim: String) -> String {
    let off = indexOf(delim, in: line)
    let start = line.index(line.startIndex, offsetBy: off)
    return String(line[start...])
}

func checkSecondToken(_ line: String, delim: String) -> String {
    let delimEndPos = delim.count
    let startIdx = line.index(line.startIndex, offsetBy: delimEndPos)
    let endIdx = line.index(line.startIndex, offsetBy: delimEndPos+5)
    let checkStr = line[startIdx...endIdx]
    var result = ""
    if checkStr.contains("todo") {
        result = "todo"
    }
    else if checkStr.contains("?") {
        result = "?"
    }
    else if checkStr.contains("!") {
        result = "!"
    }
    else if checkStr.contains("*") {
        result = "*"
    }
    else if checkStr.contains("//") {
        result = "//"
    }
    else {
        result = "NONE"
    }
    return result
}

func containsAny(str: String, options: [String]) -> Bool {
    for option in options {
        if str.contains(option) { return true }
    }
    return false
}