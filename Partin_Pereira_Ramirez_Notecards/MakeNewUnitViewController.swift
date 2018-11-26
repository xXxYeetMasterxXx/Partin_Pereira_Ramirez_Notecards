//
//  MakeNewUnitViewController.swift
//  Partin_Pereira_Ramirez_Notecards
//
//  Created by Period Three on 2018-11-26.
//  Copyright © 2018 Period Three. All rights reserved.
//

import UIKit

class MakeNewUnitViewController: UIViewController {
    
    @IBOutlet weak var unitLabel: UITextField!
    var unitMade = Unit(title: "Unit", flashcard: [])
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let safeUnit = unitLabel.text {
            unitMade.title = safeUnit
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
