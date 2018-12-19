//  MakeNewSubjectViewController.swift

import UIKit

class MakeNewSubjectViewController: UIViewController, UITextFieldDelegate {
    
    //outlet for the subject text field
    @IBOutlet weak var subjectTextField: UITextField!
    
    var madeSubject = Subject(title: "Subject", units: [])
    
    //creates a subject with the name put in the text field
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeSubject = subjectTextField.text {
            madeSubject.title = safeSubject
        }
    }
    
    //hides the keyboard when the user taps outside or presses return
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subjectTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subjectTextField.resignFirstResponder()
        return true
    }

}
