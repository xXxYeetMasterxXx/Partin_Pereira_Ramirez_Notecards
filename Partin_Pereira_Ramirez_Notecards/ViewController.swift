//  Partin_Pereira_Ramirez_Notecards
//  Sam Partin, Lucas Pereira, Milton Ramirez-Flores

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //table view outlet
    @IBOutlet weak var subjectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray.count
    }
    
    //displays the subjects in the table view cells and the amount of units within the subject in the subtitle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)
        if theSubjectArray[indexPath.row].title == "" {
            theSubjectArray[indexPath.row].title = "Subject \(indexPath.row + 1)"
        }
        ourCells.textLabel?.text = theSubjectArray[indexPath.row].title
        ourCells.detailTextLabel?.text = "\(theSubjectArray[indexPath.row].units.count) units"
        return ourCells
    }

    //sets the number to reference in the array to the row of the table view the selected subject is in
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number = indexPath.row
    }
    
    //deletes the subject, all units and flashcards within and corresponding tests
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var counter = 0
        while theSubjectArray[indexPath.row].units.count > counter {
            var counter2 = 0
            while theTestArray.count > counter2 {
                if theSubjectArray[indexPath.row].units[counter] == theTestArray[counter2].testedUnit {
                    theTestArray.remove(at: counter2)
                    Test.overallAverage.remove(at: counter2)
                    counter2 -= 1
                }
                counter2 += 1
            }
            counter += 1
        }
        theSubjectArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        saveData()
    }

    //unwinds from the MakeNewSubjectViewController and adds the subject made to the array
    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        if let sender = sender.source as? MakeNewSubjectViewController {
            theSubjectArray.append(sender.madeSubject)
        }
        saveData()
    }
    
    //reloads table view when view will appear
    override func viewWillAppear(_ animated: Bool) {
        subjectTableView.reloadData()
    }

}
