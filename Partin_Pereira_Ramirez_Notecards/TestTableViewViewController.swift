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
        super.viewWillAppear(true)
        testTableView.reloadData()
        isSearched = false
        testArrayBackup = theTestArray
        theTestArray = testArrayBackup
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        theTestArray = testArrayBackup
    }
    
    @IBAction func greaterThanAction(_ sender: Any) {
        compare(button: greaterThanButton, button2: exactlyButton, button3: lessThanButton, type: 1)
    }
    
    @IBAction func exactlyAction(_ sender: Any) {
        compare(button: exactlyButton, button2: greaterThanButton, button3: lessThanButton, type: 2)
    }
    
    @IBAction func lessThanAction(_ sender: Any) {
        compare(button: lessThanButton, button2: greaterThanButton, button3: exactlyButton, type: 3)
    }
    
    func searching (searchValue: Double, array: [Double], type: Int) -> Bool {
        var newTestArray: [Int] = []
        switch type {
        case 1:
            for index in 0..<array.count {
                if array[index] > searchValue {
                    newTestArray.append(index)
                }
            }
        case 2:
            for index in 0..<array.count {
                if array[index] == searchValue {
                    newTestArray.append(index)
                }
            }
        case 3:
            for index in 0..<array.count {
                if array[index] < searchValue {
                    newTestArray.append(index)
                }
            }
        default:
            print("f")
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
        return percentArray
    }
    
    func compare(button: UIButton, button2: UIButton, button3: UIButton, type: Int) {
        if isSearched {
            button.backgroundColor = #colorLiteral(red: 0.921471417, green: 0.9216262698, blue: 0.9214497209, alpha: 1)
            button2.isEnabled = true
            button3.isEnabled = true
            theTestArray = testArrayBackup
            testTableView.reloadData()
            isSearched = false
        } else {
            button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            button2.isEnabled = false
            button3.isEnabled = false
            isSearched = true
            if let safePercent = Double(percentTextField.text!) {
                if searching(searchValue: safePercent, array: makePercentArray(testArray: theTestArray), type: type) {
                }
            }
        }
    }
    
}
