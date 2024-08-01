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

func orderComments(comments: [String]) -> [String] {
    var result: [String] = []
    var strikes: [String] = []
    var questions: [String] = []
    var exclamations: [String] = []
    var stars: [String] = []
    var todos: [String] = []
    for comment in comments {
        if comment.starts(with: "//") {
            strikes.append(comment)
        }
        else if comment.starts(with: "?") {
            questions.append(comment)
        }
        else if comment.starts(with: "!") {
            exclamations.append(comment)
        }
        else if comment.starts(with: "*") {
            stars.append(comment)
        }
        else if comment.starts(with: "todo") {
            todos.append(comment)
        }
    }
    result = exclamations + todos + questions + stars + strikes
    return result
}

func doNothing() {
    let _ = """
    //todo: write functionality for each symbol
    E.g.
    Exclamation lines may get debug info.
    Todo lines may appear first in the console.
    Etc.
    """
}