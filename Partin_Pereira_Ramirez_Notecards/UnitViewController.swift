//  UnitViewController.swift

import UIKit

class UnitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var unitTableView: UITableView!
    @IBOutlet weak var unitItem: UINavigationItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theSubjectArray[number].units.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCells2 = tableView.dequeueReusableCell(withIdentifier: "UnitCell", for: indexPath)
        ourCells2.textLabel?.text = theSubjectArray[number].units[indexPath.row].title
        ourCells2.detailTextLabel?.text = "\(theSubjectArray[number].units[indexPath.row].flashcards.count) flashcards"
        return ourCells2
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        theSubjectArray[number].units.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number2 = indexPath.row
    }
    
    @IBAction func unwind2(_ sender: UIStoryboardSegue) {
        if let sender2 = sender.source as? MakeNewUnitViewController {
            theSubjectArray[number].units.append(sender2.unitMade)
        }
        unitTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        unitItem.title = theSubjectArray[number].title
    }
    
}
