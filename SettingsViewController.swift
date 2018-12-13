//  SettingsViewController.swift

import UIKit
import UserNotifications

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var studySwitch: UISwitch!
    @IBOutlet weak var remindTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var viewTests: UIButton!
    var remindTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remindTextField.isHidden = true
        timePicker.isHidden = true
        if theTestArray.isEmpty {
            viewTests.isHidden = true
            
        }
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    self.remindTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        remindTextField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if studySwitch.isOn {
            getMinutes()
        } else {
            cancel()
        }
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        if studySwitch.isOn == true {
            remindTextField.isHidden = false
            timePicker.isHidden = false
        } else {
            remindTextField.isHidden = true
            timePicker.isHidden = true
        }
    }
    
    func getMinutes() {
        remindTime = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: remindTime)
        guard let hour = components.hour else {return}
        guard let minute = components.minute else {return}
        let minutes = Double((60 * hour) + minute)
        notifications(seconds: (60 * minutes))
    }
    
    func notifications(seconds: Double) {
        let content = UNMutableNotificationContent()
        guard let safeText = remindTextField.text else {return}
        content.title = safeText
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)
        let request = UNNotificationRequest(identifier: "studyTime", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func cancel() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}
