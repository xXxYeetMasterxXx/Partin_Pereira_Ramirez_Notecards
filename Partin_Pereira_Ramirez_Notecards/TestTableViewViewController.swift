//  TestTableViewViewController.swift

import UIKit

class TestTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var greaterThanButton: UIButton!
    @IBOutlet weak var exactlyButton: UIButton!
    @IBOutlet weak var lessThanButton: UIButton!
    @IBOutlet weak var percentTextField: UITextField!
    @IBOutlet weak var testTableView: UITableView!
    
    var testArrayBackup: [Test] = []
    //var sortedTests: [Test] = []
    var isSearched = false
    
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

    
    @IBAction func unwind4(_ sender: UIStoryboardSegue) {
        testTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        testTableView.reloadData()
        isSearched = false
        testArrayBackup = theTestArray
        theTestArray = testArrayBackup
    }
    
    @IBAction func greaterThanAction(_ sender: Any) {
    }
    
    @IBAction func exactlyAction(_ sender: Any) {
        if isSearched {
            exactlyButton.backgroundColor = #colorLiteral(red: 0.921471417, green: 0.9216262698, blue: 0.9214497209, alpha: 1)
            theTestArray = testArrayBackup
            testTableView.reloadData()
            isSearched = false
        } else {
            exactlyButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            isSearched = true
            if let safePercent = Double(percentTextField.text!) {
                print("here")
                if searching(searchValue: safePercent, array: makePercentArray(testArray: theTestArray), type: 2) {
                    print("nice")
                }
            }
        }
    }
    
    @IBAction func lessThanAction(_ sender: Any) {
    }
    
    func searching (searchValue: Double, array: [Double], type: Int) -> Bool {
        
        var newTestArray: [Int] = []
        
        for index in 0..<array.count {
            if array[index] == searchValue {
                newTestArray.append(index)
            }
        }
        if newTestArray != [] {
            theTestArray = []
            for index in 0..<newTestArray.count {
                theTestArray.append(testArrayBackup[newTestArray[index]])
            }
            testTableView.reloadData()
            return true
        }
        return false
    }
    
    func makePercentArray(testArray: [Test]) -> [Double] {
        var percentArray: [Double] = []
        //theTestArray = theTestArray.sorted(by: <)
        for index in 0..<testArray.count {
            percentArray.append(theTestArray[index].percent)
        }
        print(percentArray)
        return percentArray
    }
}
