
import Foundation

var theSubjectArray: [Subject] = []

struct Subject {
    var title: String
    var units: [Unit]
}

struct Unit {
    var title: String
    var flashcard: [Flashcard]
}

struct Flashcard {
    var title: String
    var text1: String
    var text2: String
    var type: NoteType
    
    enum NoteType {
        case definiton
        case question
        case note
    }
}
