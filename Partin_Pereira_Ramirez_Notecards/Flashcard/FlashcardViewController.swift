//  FlashcardViewController.swift

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //makes outlets for stuff
    @IBOutlet weak var flashcardsTableView: UITableView!
    @IBOutlet weak var flashVCBrowseButton: UIBarButtonItem!
    @IBOutlet weak var flashTestYourselfButton: UIBarButtonItem!
    
    //makes rows equal to the number of flashcards
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSubjectArray[number].units[number2].flashcards.count
    }
    
    //puts the flashcard titles or gives them a default value and says what type they are
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
    
    //assigns the element pressed to a global number
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number3 = indexPath.row
    }
    
    //allows the user to delete flashcards, then enables the buttons and saves data
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theSubjectArray[number].units[number2].flashcards.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        enabled()
        saveData()
    }
    
    //adds a flashcard from makeNewFlashcardViewController, then enables and saves data
    @IBAction func unwind3(_ sender: UIStoryboardSegue) {
        if let sender3 = sender.source as? MakeNewFlashcardViewController {
            theSubjectArray[number].units[number2].flashcards.append(sender3.flashcardMade)
        }
        enabled()
        saveData()
    }
    
    //enables when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        enabled()
    }
    
    //reloads data
    override func viewWillAppear(_ animated: Bool) {
        flashcardsTableView.reloadData()
    }
    
    //determines which buttons should be enabled and disabled
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
    
    //sees if there are only notes
    func findNotes (checkingFlashcards: [Flashcard]) -> Bool {
        for index in 0 ..< checkingFlashcards.count {
            guard checkingFlashcards[index].type == .note else {
                return false
            }
        }
        return true
    }
    
}
