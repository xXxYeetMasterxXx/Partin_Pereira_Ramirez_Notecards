//  TestViewController.swift

import UIKit

class TestViewController: UIViewController, UITextFieldDelegate {
    
    //outlets for all of the labels and buttons of the test
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var outcomeLabel: UILabel!
    
    //variables for the array of flashcards as well as the number correct, number of questions, position in the flashcard array, and a string for testing punctuation
    var testArrayOfFlashcards: [Flashcard] = []
    var thisTest = Test(title: "", amount: 0, correct: 0, percent: 0, amoundOfQuestions: 0, testedUnit: theSubjectArray[number].units[number2])
    var correct = 0
    var question = 0
    var spotInArray = 0
    var check = ""
    
    //displays the results of the test in TestOverviewViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ourTest = segue.destination as! TestOverviewViewController
        ourTest.testToDisplay = thisTest
    }
    
    //hides the keyobard when the user presses return or outside the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerTextField.resignFirstResponder()
        return true
    }

    //hides the appropriate buttons, resets the test array, finds the quesions/definitions, and shuffles the array when the view appears
    override func viewWillAppear(_ animated: Bool) {
        nextButton.isHidden = true
        doneButton.isHidden = true
        outcomeLabel.isHidden = true
        testArrayOfFlashcards = []
        recursion(theSubjectArray[number].units[number2].flashcards.count - 1)
        testArrayOfFlashcards.shuffle()
        
        //adds the title of the flashcard, then shows the question/definition with the appropriate wording
        titleLabel.text = testArrayOfFlashcards[spotInArray].title
        if testArrayOfFlashcards[spotInArray].type == .definition {
            questionLabel.text = "What is \"\(testArrayOfFlashcards[spotInArray].text2)\" the definition for?"
        } else if testArrayOfFlashcards[spotInArray].text1.hasSuffix("?") {
            questionLabel.text = testArrayOfFlashcards[spotInArray].text1
        } else {
            questionLabel.text = "\(testArrayOfFlashcards[spotInArray].text1)?"
        }
    }
    
    //when the answer button is selected it determines whether the answer is correct or wrong, and if it is the last question in the test
    @IBAction func answerButtonAction(_ sender: Any) {
        check = testArrayOfFlashcards[spotInArray].text2.lowercased()
        answerTextField.isEnabled = false
        if check.count > 1 && (check.hasSuffix("?") || check.hasSuffix(".") || check.hasSuffix("!")) {
            check.removeLast()
        }
        if testArrayOfFlashcards[spotInArray].type == .definition {
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
            if answerTextField.text?.lowercased() == testArrayOfFlashcards[spotInArray].text2.lowercased() || answerTextField.text?.lowercased() == check {
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
        if spotInArray == testArrayOfFlashcards.count - 1 {
            answerButton.isHidden = true
            doneButton.isHidden = false
        } else {
            answerButton.isEnabled = false
            nextButton.isHidden = false
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        answerButton.isEnabled = true
        nextButton.isHidden = true
        outcomeLabel.isHidden = true
        answerTextField.isEnabled = true
        answerTextField.text = ""
        spotInArray += 1
        titleLabel.text = testArrayOfFlashcards[spotInArray].title
        if testArrayOfFlashcards[spotInArray].type == .definition {
            questionLabel.text = "What is \"\(testArrayOfFlashcards[spotInArray].text2)\" the definition for?"
        } else {
            check = testArrayOfFlashcards[spotInArray].text1
            if check.hasSuffix("?") {
                questionLabel.text = testArrayOfFlashcards[spotInArray].text1
            } else {
                questionLabel.text = "\(testArrayOfFlashcards[spotInArray].text1)?"
            }
        }
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        thisTest = Test(title: theSubjectArray[number].units[number2].title, amount: testArrayOfFlashcards.count, correct: correct, percent: thisTest.findPercent(items: Double(testArrayOfFlashcards.count), correct: Double(correct)), amoundOfQuestions: question, testedUnit: theSubjectArray[number].units[number2])
        if thisTest.percent > thisTest.testedUnit.personalBest {
            thisTest.testedUnit.personalBest = thisTest.percent
        }
        Test.overallAverage.append(thisTest.percent)
        theTestArray.append(thisTest)
        saveData()
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
