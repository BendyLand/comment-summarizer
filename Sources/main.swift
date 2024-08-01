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
    let symbols = ["//", "?", "!", "*","todo"]
    var actionComments: [String] = []
    for comment in comments {
        var temp = comment.trimmingCharacters(in: .whitespaces)
        temp = extractComment(temp, delim: delim.rawValue)
        if startsWithAny(temp, options: symbols) {
            actionComments.append(temp)
        }
    }
    actionComments.sort()
    let orderedComments = orderComments(comments: actionComments)
    for comment in orderedComments {
        print(comment)
    }
}

main()
