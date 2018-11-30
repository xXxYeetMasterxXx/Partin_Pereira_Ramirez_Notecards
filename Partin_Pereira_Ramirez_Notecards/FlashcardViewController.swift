//  FlashcardViewController.swift

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var flashcardsTableView: UITableView!
    
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
        } else {
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
    }
    
    @IBAction func unwind3(_ sender: UIStoryboardSegue) {
        if let sender3 = sender.source as? MakeNewFlashcardViewController {
            theSubjectArray[number].units[number2].flashcards.append(sender3.flashcardMade)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        flashcardsTableView.reloadData()
    }
    
}
