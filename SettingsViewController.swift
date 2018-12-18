//  SettingsViewController.swift

import UIKit
import UserNotifications

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    //makes outlets for all the stuff
    @IBOutlet weak var studySwitch: UISwitch!
    @IBOutlet weak var remindTextField: UITextField!
    @IBOutlet weak var repeatsLabel: UILabel!
    @IBOutlet weak var repeatsSwitch: UISwitch!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var viewTests: UIButton!
    var remindTime = Date()
    
    
    //hides the keyboard when the user taps outside the screen
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        self.remindTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    //assigns the remind switch to its global value, then hides the reminder elements if it is false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        studySwitch.isOn = remindIsOn
        if studySwitch.isOn == false {
            remindTextField.isHidden = true
            repeatsLabel.isHidden = true
            repeatsSwitch.isHidden = true
            timePicker.isHidden = true
        }
        if theTestArray.isEmpty {
            viewTests.isHidden = true
        }
    }
    
    //hides keyobard when user clicks return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        remindTextField.resignFirstResponder()
        return true
    }

    //calls upon the appropriate functions when a segue is going to happen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if studySwitch.isOn {
            getMinutes()
        } else {
            cancel()
        }
    }
    
    //hides or reveals reminder stuff when the reminders on switch is pressed
    @IBAction func switchPressed(_ sender: Any) {
        if studySwitch.isOn == true {
            remindTextField.isHidden = false
            repeatsLabel.isHidden = false
            repeatsSwitch.isHidden = false
            timePicker.isHidden = false
        } else {
            remindTextField.isHidden = true
            repeatsLabel.isHidden = true
            repeatsSwitch.isHidden = true
            timePicker.isHidden = true
        }
    }
    
    //gets the number of minutes from the date picker
    func getMinutes() {
        remindIsOn = true
        remindTime = timePicker.date
        let repeats = repeatsSwitch.isOn
        let components = Calendar.current.dateComponents([.hour, .minute], from: remindTime)
        guard let hour = components.hour else {return}
        guard let minute = components.minute else {return}
        let minutes = Double((60 * hour) + minute)
        notifications(seconds: (60 * minutes), repeats: repeats)
    }
    
    //creates a notifcation based on the time and if it repeats if the reminders switch is pressed
    func notifications(seconds: Double, repeats: Bool) {
        let content = UNMutableNotificationContent()
        guard let safeText = remindTextField.text else {return}
        content.title = safeText
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: repeats)
        let request = UNNotificationRequest(identifier: "studyTime", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //cancels all notifcations if the reminder switch is off
    func cancel() {
        remindIsOn = false
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}
