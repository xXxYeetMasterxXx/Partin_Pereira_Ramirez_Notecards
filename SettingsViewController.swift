//  SettingsViewController.swift

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var studySwitch: UISwitch!
    @IBOutlet weak var remindTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    
    
    @IBAction func switchPressed(_ sender: Any) {
        if studySwitch.isOn == true {
            remindTextField.isHidden = false
            timePicker.isHidden = false
        } else {
            remindTextField.isHidden = true
            timePicker.isHidden = true
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studySwitch.isOn = false
        remindTextField.isHidden = true
        timePicker.isHidden = true
    }

}
