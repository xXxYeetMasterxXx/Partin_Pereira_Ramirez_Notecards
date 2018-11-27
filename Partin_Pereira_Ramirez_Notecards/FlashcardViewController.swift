//  FlashcardViewController.swift

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
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
    
    @IBAction func unwind3(_ sender: UIStoryboardSegue) {
        if let sender3 = sender.source as? MakeNewFlashcardViewController {
            theSubjectArray[number].units[number2].flashcards.append(sender3.flashcardMade)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
