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
        ourCells.textLabel?.text = theSubjectArray[indexPath.row].title
        ourCells.detailTextLabel?.text = "\(theSubjectArray[indexPath.row].units.count) units"
        return ourCells
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number = indexPath.row
    }

    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        subjectTableView.reloadData()
    }

}
