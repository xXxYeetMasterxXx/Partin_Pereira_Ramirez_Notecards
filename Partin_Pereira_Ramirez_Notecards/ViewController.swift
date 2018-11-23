//  Partin_Pereira_Ramirez_Notecards
//  Sam Partin, Lucas Pereira, Milton Ramirez-Flores

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Testing")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return theSubjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells = tableView.dequeueReusableCell(withIdentifier: "SubjecCell", for: indexPath)
        ourCells.textLabel?.text = theSubjectArray[indexPath.row].title
        ourCells.detailTextLabel?.text = "\(theSubjectArray[indexPath.row].units.count) units"
        return ourCells
    }

}
