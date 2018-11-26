//  MakeNewSubjectViewController.swift

import UIKit

class MakeNewSubjectViewController: UIViewController {

    @IBOutlet weak var subjectLabel: UITextField!
    
    
    
    
    var madeSubject = Subject(title: "Subject", units: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
