//  MakeNewSubjectViewController.swift

import UIKit

class MakeNewSubjectViewController: UIViewController {

    @IBOutlet weak var subjectLabel: UITextField!
    
    var madeSubject = Subject(title: "Subject", units: [])
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeSubject = subjectLabel.text {
            madeSubject.title = safeSubject
            theSubjectArray.append(madeSubject)
            print("thisWorks")
        }
    }
}
