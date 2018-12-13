//  FlashcardViewController.swift

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var flashcardsTableView: UITableView!
    @IBOutlet weak var flashVCBrowseButton: UIBarButtonItem!
    @IBOutlet weak var flashTestYourselfButton: UIBarButtonItem!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray[number].units[number2].flashcards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells3 = tableView.dequeueReusableCell(withIdentifier: "FlashCardCell", for: indexPath)
        if theSubjectArray[number].units[number2].flashcards[indexPath.row].title == "" {
            theSubjectArray[number].units[number2].flashcards[indexPath.row].title = "Flashcard \(indexPath.row + 1)"
        }
        ourCells3.textLabel?.text = theSubjectArray[number].units[number2].flashcards[indexPath.row].title
        if theSubjectArray[number].units[number2].flashcards[indexPath.row].type == .note {
            ourCells3.detailTextLabel?.text = "Note"
        } else if theSubjectArray[number].units[number2].flashcards[indexPath.row].type == .question {
            ourCells3.detailTextLabel?.text = "Question"
        } else if theSubjectArray[number].units[number2].flashcards[indexPath.row].type == .definition  {
            ourCells3.detailTextLabel?.text = "Definiton"
        }
        return ourCells3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number3 = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theSubjectArray[number].units[number2].flashcards.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        enabled()
        saveData()
    }
    
    @IBAction func unwind3(_ sender: UIStoryboardSegue) {
        if let sender3 = sender.source as? MakeNewFlashcardViewController {
            theSubjectArray[number].units[number2].flashcards.append(sender3.flashcardMade)
        }
        enabled()
        saveData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        enabled()
    }

    override func viewWillAppear(_ animated: Bool) {
        flashcardsTableView.reloadData()
        
    }
    
    func enabled () {
        if theSubjectArray[number].units[number2].flashcards.isEmpty == true {
            flashVCBrowseButton.isEnabled = false
            flashTestYourselfButton.isEnabled = false
        } else if findNotes(checkingFlashcards: theSubjectArray[number].units[number2].flashcards) {
            flashTestYourselfButton.isEnabled = false
            flashVCBrowseButton.isEnabled = true
        } else {
            flashVCBrowseButton.isEnabled = true
            flashTestYourselfButton.isEnabled = true
        }
    }
    
    func findNotes (checkingFlashcards: [Flashcard]) -> Bool {
        for index in 0 ..< checkingFlashcards.count {
            guard checkingFlashcards[index].type == .note else {
                return false
            }
        }
        return true
    }
    
}
