
let args = CommandLine.arguments
var path = ""
if args.count > 1 {
    path = args[1]
}
let lang = detectLanguage(filename: path)
let file = readFileToString(filename: path)
let lines = file.components(separatedBy: "\n")
let delim = determineCommentStyle(lang: lang)

let comments: [String] = extractCommentLines(lines: lines, lang: lang)
for comment in comments {
    var temp = comment.trimmingCharacters(in: .whitespaces)
    if !temp.starts(with: delim.rawValue) {
        temp = extractComment(line: temp, delim: delim.rawValue)
    }
    print("Comment: \(temp)")
}
