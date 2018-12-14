//  EditFlashcardViewController.swift

import UIKit

class EditFlashcardViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    //stores the color of the flashcard being made
    var flashcardColour: Colour = theSubjectArray[number].units[number2].flashcards[number3].colour
    
    //outlets for all of the input items
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var text1TextView: UITextView!
    @IBOutlet weak var text2TextView: UITextView!
    @IBOutlet weak var colourButton: UIButton!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    //makes the keyobard disapear with return and clicking outside as well as makes the view scroll down when the keyboard is pulled up to keep visibility
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        text1TextView.resignFirstResponder()
        return true
    }
    func textViewShouldReturn2(_ textView: UITextView) -> Bool {
        text2TextView.resignFirstResponder()
        return true
    }
    
    //stores the type of flashcard in a variable then uses it to assign the flashcard all of the new values
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let flashcardType = theSubjectArray[number].units[number2].flashcards[number3].type
        theSubjectArray[number].units[number2].flashcards[number3] = Flashcard(title: titleTextField.text!, text1: text1TextView.text!, text2: text2TextView.text!, colour: flashcardColour, type: flashcardType)
    }
    
    //allows for keyboard hiding
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //updates all of the UI elements in the view to what the flashcard currenlty has
    override func viewWillAppear(_ animated: Bool) {
        titleTextField.text = theSubjectArray[number].units[number2].flashcards[number3].title
        text1TextView.text = theSubjectArray[number].units[number2].flashcards[number3].text1
        text2TextView.text = theSubjectArray[number].units[number2].flashcards[number3].text2
        if flashcardColour == .orange {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else if flashcardColour == .pink{
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
        } else if flashcardColour == .red {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1)
        } else if flashcardColour == .blue {
            colourButton.backgroundColor = #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
        } else if flashcardColour == .green {
            colourButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else if flashcardColour == .yellow {
            colourButton.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        }
        if theSubjectArray[number].units[number2].flashcards[number3].type == .note {
            labelOne.text = "Enter Note:"
            text2TextView.isHidden = true
            labelTwo.isHidden = true
        } else if theSubjectArray[number].units[number2].flashcards[number3].type == .question {
            labelOne.text = "Enter Question:"
            labelTwo.text = "Enter Answer:"
        } else {
            labelOne.text = "Enter Word:"
            labelTwo.text = "Enter Definition:"
        }
    }
    
    //assigns the flashcard a color when the color button is pressed
    @IBAction func colourButtonPressed(_ sender: Any) {
        if colourButton.backgroundColor == #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            flashcardColour = .orange
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
            flashcardColour = .pink
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1)
            flashcardColour = .red
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
            flashcardColour = .blue
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            flashcardColour = .green
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
            flashcardColour = .yellow
        }
    }
    
}
