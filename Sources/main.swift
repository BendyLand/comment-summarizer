func main() {
    let args = CommandLine.arguments
    var path = ""
    if args.count > 1 {
        path = args[1]
    }
    let lang = detectLanguage(filename: path)
    let file = readFileToString(filename: path)
    let lines = file.components(separatedBy: "\n")
    let delim = determineCommentStyle(lang: lang)
    let comments: [String] = extractCommentLines(lines, lang: lang)
    let symbols = ["?", "!", "*","todo"]
    var actionComments: [String] = []
    for comment in comments {
        var temp = comment.trimmingCharacters(in: .whitespaces)
        if !temp.starts(with: delim.rawValue) {
            temp = extractComment(temp, delim: delim.rawValue)
        }
        let secondTokenStr = checkSecondToken(temp, delim: delim.rawValue)
        if containsAny(str: secondTokenStr, options: symbols) {
            actionComments.append(temp)
        }
    }
    actionComments.sort()
    handleTokens(comments: actionComments)
}

main()