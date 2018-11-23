
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

struct Flashcard: SetNoteType {
    var title: String
    var text1: String
    var text2: String
    var type: NoteType
    mutating func beAType (notePicked: String) {
        if notePicked == "Definiton" {
            type = .definiton
        } else if notePicked == "Question" {
            type = .question
        } else {
            type = .note
        }
    }
}

enum NoteType {
    case definiton
    case question
    case note
}

protocol SetNoteType {
    var type: NoteType {get set}
    mutating func beAType (notePicked: String)
}
