//  ViewFlashcardViewController.swift

import UIKit

class ViewFlashcardViewController: UIViewController {
    
    //outlet for the flashcard being displayed
    @IBOutlet weak var flashcardButton: UIButton!
    
    var flipped = false
    
    //saves data when you unwind from edit
    @IBAction func unwind5(_ sender: UIStoryboardSegue) {
        saveData()
    }
    
    //displays the chosen flashcard and makes it landscape
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        flashcardButton.backgroundColor = colourPicker(colour: theSubjectArray[number].units[number2].flashcards[number3].colour)
        flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
        if theSubjectArray[number].units[number2].flashcards[number3].type == .note {
            flashcardButton.isEnabled = false
        }
    }
    
    //makes the device portrait when the user leaves this view
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    //flips the flahscard with a cool animation
    @IBAction func flashcardButtonAction(_ sender: Any) {
        if flipped == false {
            flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text2, for: .normal)
            UIView.transition(with: flashcardButton, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            flipped = true
        } else {
            flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
            UIView.transition(with: flashcardButton, duration: 0.5, options: .transitionFlipFromBottom, animations: nil, completion: nil)
            flipped = false
        }
    }
    
}
