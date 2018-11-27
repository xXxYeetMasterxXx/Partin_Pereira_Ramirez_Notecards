//  SettingsViewController.swift

import UIKit
import UserNotifications

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var studySwitch: UISwitch!
    @IBOutlet weak var remindTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    var remindTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studySwitch.isOn = false
        remindTextField.isHidden = true
        timePicker.isHidden = true
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if studySwitch.isOn {
            remindTime = timePicker.date
            //let components = Calendar.current.dateComponents([.hour, .minute], from: remindTime)
            //let hour = components.hour!
            //let minute = components.minute
            //print(minute)
            notifications()
            print("this works")
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
    func notifications() {
        let content = UNMutableNotificationContent()
        guard let safeText = remindTextField.text else {return}
        content.title = safeText
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "studyTime", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("me too thanjs")
    }
    
    
    

}
