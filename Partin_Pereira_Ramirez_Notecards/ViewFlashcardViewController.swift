//  ViewFlashcardViewController.swift

import UIKit

class ViewFlashcardViewController: UIViewController {

    @IBOutlet weak var flashcardButton: UIButton!
    
    var flipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        flashcardButton.backgroundColor = theSubjectArray[number].units[number2].flashcards[number3].colour
        flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
        if theSubjectArray[number].units[number2].flashcards[number3].type == .note {
            flashcardButton.isEnabled = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    @IBAction func flashcardButtonAction(_ sender: Any) {
        if flipped == false {
            flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text2, for: .normal)
            flipped = true
        } else {
            flashcardButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
            flipped = false
        }
    }
    
}
