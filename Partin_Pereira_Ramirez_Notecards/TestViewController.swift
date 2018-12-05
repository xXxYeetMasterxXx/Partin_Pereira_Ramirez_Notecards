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
    var thisTest = Test(title: "", amount: 0, correct: 0, percent: 0, amoundOfQuestions: 0, testedUnit: theSubjectArray[number].units[number2])
    var correct = 0
    var question = 0
    var spotInArray = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ourTest = segue.destination as! TestOverviewViewController
        ourTest.testToDisplay = thisTest
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextButton.isHidden = true
        doneButton.isHidden = true
        outcomeLabel.isHidden = true
        testArrayOfFlashcards = []
        recursion(theSubjectArray[number].units[number2].flashcards.count - 1)
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
            if answerTextField.text?.lowercased() == testArrayOfFlashcards[spotInArray].text1.lowercased() {
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
            if answerTextField.text?.lowercased() == testArrayOfFlashcards[spotInArray].text2.lowercased() {
                correct += 1
                outcomeLabel.text = "Correct"
                outcomeLabel.textColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            } else {
                outcomeLabel.text = "Wrong"
                outcomeLabel.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
                outcomeLabel.isHidden = false
            }
            question += 1
        }
        answerButton.isEnabled = false
        nextButton.isHidden = false
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        answerButton.isEnabled = true
        nextButton.isHidden = true
        outcomeLabel.isHidden = true
        answerTextField.text = ""
        if spotInArray == testArrayOfFlashcards.count - 1 {
            answerButton.isHidden = true
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
    
    @IBAction func doneButtonAction(_ sender: Any) {
        thisTest = Test(title: "\(theSubjectArray[number].units[number2].title) Test", amount: testArrayOfFlashcards.count, correct: correct, percent: thisTest.findIncorrectAndPercent(items: testArrayOfFlashcards.count, correct: correct).1, amoundOfQuestions: question, testedUnit: theSubjectArray[number].units[number2])
        Test.overallAverage.append(thisTest.percent)
        theTestArray.append(thisTest)
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
