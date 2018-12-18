
import UIKit
import Foundation

//makes global variables to store tests and subjects
var theSubjectArray: [Subject] = []
var theTestArray: [Test] = []

//makes numbers to store which element in an array it is on
var number: Int = 0
var number2: Int = 0
var number3: Int = 0
var number4: Int = 0

//structure that defines a subject and its title and units
struct Subject: Codable {
    var title: String
    var units: [Unit]
}

//class that defines a unit as well as its title, flashcards, and personal best
class Unit: Equatable, Codable {
    var title: String
    var flashcards: [Flashcard]
    var personalBest: Double = 0
    init (title: String, flashcards: [Flashcard], personalBest: Double) {
        self.title = title
        self.flashcards = flashcards
        self.personalBest = personalBest
    }
    static func == (lhs: Unit, rhs: Unit) -> Bool {
        return lhs.title == rhs.title
    }
}

//structure that defines a flashcard as well as its title, both sides of text, color, and type
struct Flashcard: SetNoteType, Codable {
    var title: String
    var text1: String
    var text2: String
    var colour: Colour
    var type: NoteType
    mutating func beAType (notePicked: String) -> NoteType {
        var type: NoteType
        if notePicked == "Definition" {
            type = .definition
        } else if notePicked == "Question" {
            type = .question
        } else {
            type = .note
        }
        return type
    }
}

//structure that defines a test
struct Test: Codable, Comparable {
    static func < (lhs: Test, rhs: Test) -> Bool {
        return lhs.percent < rhs.percent
    }
    
    var title: String
    var amount: Int
    var correct: Int
    var percent: Double
    var amoundOfQuestions: Int
    var testedUnit: Unit
    static var overallAverage: [Double] = []
    func findIncorrect (items: Int, correct: Int) -> Int {
        return items - correct
    }
    func findPercent (items: Double, correct: Double) -> Double {
        return round(100*(correct/items)*100)/100
    }
    func findDefinitions (items: Int, questions: Int) -> Int {
        return items - questions
    }
    func findOverallAverage (overallArray: [Double]) -> Double {
        var overallPercent: Double = 0
        for index in 0 ..< overallArray.count {
            overallPercent += overallArray[index]
        }
        return round(100*(overallPercent/Double(overallArray.count)))/100
    }
}

//declares what type of flashcard it is
enum NoteType: Int, Codable {
    case definition
    case question
    case note
}

//determines the color of the flashcard
enum Colour: Int, Codable {
    case yellow
    case orange
    case pink
    case red
    case blue
    case green
}

//gets the note type
protocol SetNoteType {
    var type: NoteType {get set}
    mutating func beAType (notePicked: String) -> NoteType
}

//gives the flashcards colors according to their color enum
func colourPicker(colour: Colour) -> UIColor {
    switch colour {
    case .yellow:
        return #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
    case .orange:
        return #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    case .pink:
        return #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
    case .red:
        return #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1)
    case .blue:
        return #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
    case .green:
        return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
}

//makes identifiers to save data with
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")
let archiveURL2 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist2")
let archiveURL3 = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist3")

//saves data using the property list encoder
func saveData() {
    let pListEncoder = PropertyListEncoder()
    let encodedItem = try? pListEncoder.encode(theSubjectArray)
    try? encodedItem?.write(to: archiveURL, options: .noFileProtection)
    
    let newEncodedItem = try? pListEncoder.encode(theTestArray)
    try? newEncodedItem?.write(to: archiveURL2, options: .noFileProtection)
    
    let evenNewerEncodedItem = try? pListEncoder.encode(Test.overallAverage)
    try? evenNewerEncodedItem?.write(to: archiveURL3, options: .noFileProtection)
}

//loads data using the property list encoder
func loadData() {
    let pListDecoder = PropertyListDecoder()
    if let retrivedItemsData = try? Data(contentsOf: archiveURL), let decodedNotes = try?
        pListDecoder.decode(Array<Subject>.self, from: retrivedItemsData) {
        theSubjectArray = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL2), let decodedNotes = try?
        pListDecoder.decode(Array<Test>.self, from: retrivedItemsData) {
        theTestArray = decodedNotes
    }
    if let retrivedItemsData = try? Data(contentsOf: archiveURL3), let decodedNotes = try?
        pListDecoder.decode(Array<Double>.self, from: retrivedItemsData) {
        Test.overallAverage = decodedNotes
    }
    
}
