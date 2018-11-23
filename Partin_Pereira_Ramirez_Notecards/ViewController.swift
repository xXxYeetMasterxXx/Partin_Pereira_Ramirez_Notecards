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
        let ourCells1 = tableView.dequeueReusableCell(withIdentifier: "ProCells1", for: indexPath)
        ourCells1.textLabel?.text = theSubjectArray[indexPath.row].title
        return ourCells1
    }

}

