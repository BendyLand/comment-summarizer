
let args = CommandLine.arguments
var path = ""
if args.count > 1 {
    path = args[1]
}
let lang = detectLanguage(filename: path)
let file = readFileToString(filename: path)
let lines = file.components(separatedBy: "\n")

var todos: [String] = extractTodoLines(lines: lines, lang: lang)
var exclamations: [String] = []
var questions: [String] = []
var strikethroughs: [String] = []

