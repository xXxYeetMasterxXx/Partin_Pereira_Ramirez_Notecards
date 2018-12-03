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
        doneButton.isHidden = true
        testArrayOfFlashcards.shuffle()
        titleLabel.text = testArrayOfFlashcards[0].title
        if testArrayOfFlashcards[0].type == .definiton {
            questionLabel.text = "What is \(testArrayOfFlashcards[0].text2) the definiton for?"
        } else {
            questionLabel.text = "\(testArrayOfFlashcards[0].text1)?"
        }
    }
    
}
