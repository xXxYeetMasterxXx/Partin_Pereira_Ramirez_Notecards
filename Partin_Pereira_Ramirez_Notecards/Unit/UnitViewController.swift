//  UnitViewController.swift

import UIKit

class UnitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //outlets for the tableView and navigation item
    @IBOutlet weak var unitTableView: UITableView!
    @IBOutlet weak var unitItem: UINavigationItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSubjectArray[number].units.count
    }
    
    //displays the units in the table view cells and the amount of flashcards within the unit in the subtitle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells2 = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath)
        if theSubjectArray[number].units[indexPath.row].title == "" {
            theSubjectArray[number].units[indexPath.row].title = "Unit \(indexPath.row + 1)"
        }
        ourCells2.textLabel?.text = theSubjectArray[number].units[indexPath.row].title
        ourCells2.detailTextLabel?.text = "\(theSubjectArray[number].units[indexPath.row].flashcards.count) flashcards"
        return ourCells2
    }
    
    //deletes the unit and the corresponding tests
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var counter = 0
        while theTestArray.count > counter {
            if theSubjectArray[number].units[indexPath.row] == theTestArray[counter].testedUnit {
                theTestArray.remove(at: counter)
                Test.overallAverage.remove(at: counter)
                counter -= 1
            }
            counter += 1
        }
        theSubjectArray[number].units.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        saveData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number2 = indexPath.row
    }
    
    //unwinds fomr the MakeNewUnitViewController and adds the unit made to the array
    @IBAction func unwind2(_ sender: UIStoryboardSegue) {
        if let sender2 = sender.source as? MakeNewUnitViewController {
            theSubjectArray[number].units.append(sender2.unitMade)
        }
        saveData()
    }

    //reloads table view when view will appear
    override func viewWillAppear(_ animated: Bool) {
        unitItem.title = theSubjectArray[number].title
        unitTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unitItem.title = "Units"
    }
    
}
