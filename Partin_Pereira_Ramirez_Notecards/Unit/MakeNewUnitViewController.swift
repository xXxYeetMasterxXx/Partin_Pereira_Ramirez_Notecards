//  MakeNewUnitViewController.swift

import UIKit

class MakeNewUnitViewController: UIViewController, UITextFieldDelegate {
    
    //makes an outlet for the text field
    @IBOutlet weak var unitTextField: UITextField!
    
    var unitMade = Unit(title: "Unit", flashcards: [], personalBest: 0)
    
    //makes a unit with the name put in the text field
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeUnit = unitTextField.text {
            unitMade.title = safeUnit
        }
    }
    
    //hides the keyboard when the user taps on the screen or presses return
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unitTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        unitTextField.resignFirstResponder()
        return true
    }
    
}
