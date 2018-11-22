//  Partin_Pereira_Ramirez_Notecards
//  Sam Partin, Lucas Pereira, Milton Ramirez-Flores

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Testing")
        print("Testing 2")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells1 = tableView.dequeueReusableCell(withIdentifier: "ProCells1", for: indexPath)
        return ourCells1
    }

}

