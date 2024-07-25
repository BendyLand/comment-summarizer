enum Token: String {
    case strikethrough = "//"
    case question = "?"
    case exclamation = "!"
    case star = "*"
    case todo = "todo"
    case none
}

func stringToToken(str: String) -> Token {
    var result: Token
    if str == "//" {
        result = .strikethrough
    }
    else if str == "?" {
        result = .question
    }
    else if str == "!" {
        result = .exclamation
    }
    else if str == "*" {
        result = .star
    }
    else if str == "todo" {
        result = .todo
    }
    else {
        result = .none
    }
    return result
}

func handleTokens(comments: [String]) {
    for comment in comments {
        print("Comment:\n\(comment)")
    }
}

func handleToken(token: Token, comment: String) {
    switch token {
    case .question:
        handleQuestion(comment)
    case .exclamation:
        handleExclamation(comment)
    case .star:
        handleStar(comment)
    case .todo:
        handleTodo(comment)
    case .strikethrough:
        break
    case .none:
        break
    }
}

func handleQuestion(_ comment: String) {}
func handleExclamation(_ comment: String) {}
func handleStar(_ comment: String) {}
func handleTodo(_ comment: String) {}

func doNothing() {
    let _ = """
    //todo: write functionality for each symbol
    E.g.
    Exclamation lines may get debug info.
    Todo lines may appear first in the console.
    Etc.
    """
}