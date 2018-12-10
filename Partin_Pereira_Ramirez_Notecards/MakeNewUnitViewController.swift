//  MakeNewUnitViewController.swift

import UIKit

class MakeNewUnitViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var unitLabel: UITextField!
    
    var unitMade = Unit(title: "Unit", flashcards: [], personalBest: 0)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeUnit = unitLabel.text {
            unitMade.title = safeUnit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unitLabel.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        unitLabel.resignFirstResponder()
        return true
    }
    
}
