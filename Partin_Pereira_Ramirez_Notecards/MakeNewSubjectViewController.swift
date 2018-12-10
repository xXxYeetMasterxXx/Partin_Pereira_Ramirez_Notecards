//  MakeNewSubjectViewController.swift

import UIKit

class MakeNewSubjectViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var subjectLabel: UITextField!
    
    var madeSubject = Subject(title: "Subject", units: [])
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeSubject = subjectLabel.text {
            madeSubject.title = safeSubject
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.subjectLabel.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subjectLabel.resignFirstResponder()
        return true
    }

}
