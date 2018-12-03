//  TestViewController.swift

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    var testArrayOfFlashcards = theSubjectArray[number].units[number2].flashcards
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        testArrayOfFlashcards.shuffle()
        titleLabel.text = testArrayOfFlashcards[0].title
    }
    
}
