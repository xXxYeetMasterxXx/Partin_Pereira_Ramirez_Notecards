
import UIKit
import Foundation

var theSubjectArray: [Subject] = []
var number: Int = 0
var number2: Int = 0
var number3: Int = 0

struct Subject: Codable {
    var title: String
    var units: [Unit]
}

struct Unit: Codable {
    var title: String
    var flashcards: [Flashcard]
    var average: Int
    static var overallAverage: Int = 0
}

struct Flashcard: SetNoteType, Codable {
    var title: String
    var text1: String
    var text2: String
    var colour: UIColor
    var type: NoteType
    mutating func beAType (notePicked: String) -> NoteType {
        var type: NoteType
        if notePicked == "Definition" {
            type = .definiton
        } else if notePicked == "Question" {
            type = .question
        } else {
            type = .note
        }
        return type
    }
}

enum NoteType {
    case definiton
    case question
    case note
}

protocol SetNoteType {
    var type: NoteType {get set}
    mutating func beAType (notePicked: String) -> NoteType
}

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

func saveData() {
    let pListEncoder = PropertyListEncoder()
    let encodedItem = try? pListEncoder.encode(theSubjectArray)
    
    try? encodedItem?.write(to: archiveURL, options: .noFileProtection)
}

func loadData() {
    let pListDecoder = PropertyListDecoder()
    if let retrivedItemsData = try? Data(contentsOf: archiveURL), let decodedNotes = try?
        pListDecoder.decode(Array<Subject>.self, from: retrivedItemsData) {
        theSubjectArray = decodedNotes
    }
}
