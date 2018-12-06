//  TestTableViewViewController.swift

import UIKit

class TestTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var testTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theTestArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        ourCellsTest.textLabel?.text = "\(theTestArray[indexPath.row].title) Test"
        ourCellsTest.detailTextLabel?.text = "\(theTestArray[indexPath.row].percent)%"
        return ourCellsTest
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number4 = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ourTest = segue.destination as! TestOverviewViewController
        ourTest.testToDisplay = theTestArray[number4]
    }
    
    @IBAction func unwind4(_ sender: UIStoryboardSegue) {
        testTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        testTableView.reloadData()
    }
    
}
