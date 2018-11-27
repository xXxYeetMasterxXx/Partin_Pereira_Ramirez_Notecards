
import UIKit
import Foundation

/* CODE FOR LATER
 UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
 UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
 */

var theSubjectArray: [Subject] = []
var number: Int = 0
var number2: Int = 0

struct Subject {
    var title: String
    var units: [Unit]
}

struct Unit {
    var title: String
    var flashcards: [Flashcard]
}

struct Flashcard: SetNoteType {
    var title: String
    var text1: String
    var text2: String
    var colour: UIColor
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
