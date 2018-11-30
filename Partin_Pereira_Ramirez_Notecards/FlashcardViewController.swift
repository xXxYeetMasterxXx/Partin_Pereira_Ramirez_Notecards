//  FlashcardViewController.swift

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var flashcardsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray[number].units[number2].flashcards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells3 = tableView.dequeueReusableCell(withIdentifier: "FlashCardCell", for: indexPath)
        ourCells3.textLabel?.text = theSubjectArray[number].units[number2].flashcards[indexPath.row].title
        return ourCells3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
