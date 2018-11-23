//  UnitViewController.swift

import UIKit

class UnitViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var unitTableView: UITableView!
    @IBOutlet weak var unitItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        unitItem.title = theSubjectArray[number].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSubjectArray[number].units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells2 = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath)
        
        return ourCells2
    }

}
