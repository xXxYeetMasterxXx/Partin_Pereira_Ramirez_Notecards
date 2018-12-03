//  TestViewController.swift

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var outcomeLabel: UILabel!
    var testArrayOfFlashcards: [Flashcard] = []
    var correct = 0
    var spotInArray = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func recursion(_ N: Int) {
        if N > 0 {
            recursion(N - 1)
        }
        if theSubjectArray[number].units[number2].flashcards[N].type != .note {
            testArrayOfFlashcards.append(theSubjectArray[number].units[number2].flashcards[N])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextButton.isHidden = true
        doneButton.isHidden = true
        outcomeLabel.isHidden = true
        testArrayOfFlashcards = []
        recursion(theSubjectArray[number].units[number2].flashcards.count)
        testArrayOfFlashcards.shuffle()
        titleLabel.text = testArrayOfFlashcards[spotInArray].title
        if testArrayOfFlashcards[spotInArray].type == .definiton {
            questionLabel.text = "What is \(testArrayOfFlashcards[spotInArray].text2) the definiton for?"
        } else {
            questionLabel.text = "\(testArrayOfFlashcards[spotInArray].text1)?"
        }
    }
    
    @IBAction func answerButtonAction(_ sender: Any) {
        if testArrayOfFlashcards[spotInArray].type == .definiton {
            if answerTextField.text == testArrayOfFlashcards[spotInArray].text1 {
                correct += 1
                outcomeLabel.text = "Correct"
                outcomeLabel.textColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            } else {
                outcomeLabel.text = "Wrong"
                outcomeLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            }
        } else {
            if answerTextField.text == testArrayOfFlashcards[spotInArray].text2 {
                correct += 1
                outcomeLabel.text = "Correct"
                outcomeLabel.textColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            } else {
                outcomeLabel.text = "Wrong"
                outcomeLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            }
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        nextButton.isHidden = true
        outcomeLabel.isHidden = true
        if spotInArray == testArrayOfFlashcards.count {
            doneButton.isHidden = false
        } else {
            spotInArray += 1
            titleLabel.text = testArrayOfFlashcards[spotInArray].title
            if testArrayOfFlashcards[spotInArray].type == .definiton {
                questionLabel.text = "What is \(testArrayOfFlashcards[spotInArray].text2) the definiton for?"
            } else {
                questionLabel.text = "\(testArrayOfFlashcards[spotInArray].text1)?"
            }
        }
    }
    
}
