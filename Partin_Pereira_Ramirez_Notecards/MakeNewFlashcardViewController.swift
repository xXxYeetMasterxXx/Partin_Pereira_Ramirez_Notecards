//  MakeNewFlashcardViewController.swift

import UIKit

class MakeNewFlashcardViewController: UIViewController {

    
    @IBOutlet weak var colourButton: UIButton!
    
   
    @IBAction func colourButtonPressed(_ sender: Any) {
    }
    
    
    var flashcardMade = Flashcard(title: "", text1: "", text2: "", colour: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), type: .note)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
