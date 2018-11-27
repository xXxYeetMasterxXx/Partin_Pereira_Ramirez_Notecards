//
//  FlashcardViewController.swift
//  Partin_Pereira_Ramirez_Notecards
//
//  Created by Period Three on 2018-11-26.
//  Copyright © 2018 Period Three. All rights reserved.
//

import UIKit

class FlashcardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray[number].units[number2].flashcards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells3 = tableView.dequeueReusableCell(withIdentifier: "FlashCardCell", for: indexPath)
        ourCells3.textLabel?.text = theSubjectArray[number].units[number2].flashcards[indexPath.row].title
        return ourCells3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
