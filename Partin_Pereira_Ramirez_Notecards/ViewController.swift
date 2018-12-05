//  Partin_Pereira_Ramirez_Notecards
//  Sam Partin, Lucas Pereira, Milton Ramirez-Flores

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Testing")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)
        if theSubjectArray[indexPath.row].title == "" {
            theSubjectArray[indexPath.row].title = "Subject \(indexPath.row + 1)"
        }
        ourCells.textLabel?.text = theSubjectArray[indexPath.row].title
        ourCells.detailTextLabel?.text = "\(theSubjectArray[indexPath.row].units.count) units"
        return ourCells
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theSubjectArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        saveData()
    }

    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        if let sender = sender.source as? MakeNewSubjectViewController {
            theSubjectArray.append(sender.madeSubject)
        }
        saveData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subjectTableView.reloadData()
    }

}
