//  MakeNewUnitViewController.swift

import UIKit

class MakeNewUnitViewController: UIViewController {
    
    @IBOutlet weak var unitLabel: UITextField!
    
    var unitMade = Unit(title: "Unit", flashcards: [], personalBest: 0)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeUnit = unitLabel.text {
            unitMade.title = safeUnit
        }
        saveData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
