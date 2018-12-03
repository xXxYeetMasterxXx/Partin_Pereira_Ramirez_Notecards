//  TestViewController.swift

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    var testArrayOfFlashcards: [Flashcard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        doneButton.isHidden = true
        testArrayOfFlashcards = []
        recursion(theSubjectArray[number].units[number2].flashcards.count)
        testArrayOfFlashcards.shuffle()
        titleLabel.text = testArrayOfFlashcards[0].title
        if testArrayOfFlashcards[0].type == .definiton {
            questionLabel.text = "What is \(testArrayOfFlashcards[0].text2) the definiton for?"
        } else {
            questionLabel.text = "\(testArrayOfFlashcards[0].text1)?"
        }
    }
    
    func recursion(_ N: Int) {
        if N > 0 {
            recursion(N - 1)
        }
        if theSubjectArray[number].units[number2].flashcards[N].type != .note {
            testArrayOfFlashcards.append(theSubjectArray[number].units[number2].flashcards[N])
        }
    }
}
