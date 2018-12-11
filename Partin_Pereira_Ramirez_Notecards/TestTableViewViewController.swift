//  TestTableViewViewController.swift

import UIKit

class TestTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var greaterThanButton: UIButton!
    @IBOutlet weak var exactlyButton: UIButton!
    @IBOutlet weak var lessThanButton: UIButton!
    @IBOutlet weak var percentTextField: UITextField!
    @IBOutlet weak var testTableView: UITableView!
    
    var testArrayBackup: [Test] = []
    var sortedTests: [Test] = []
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
        sortedTests = theTestArray.sorted(by: <)
        isSearched = false
        testArrayBackup = sortedTests
        sortedTests = testArrayBackup
    }
    
    @IBAction func greaterThanAction(_ sender: Any) {
        if isSearched {
            sortedTests = testArrayBackup
            testTableView.reloadData()
            isSearched = false
        } else {
            if let safePercent = Double(percentTextField.text!) {
                print("here")
                if searching(searchValue: safePercent, array: makePercentArray(testArray: sortedTests)) {
                    print("nice")
                }
            }
        }
        
    }
    
    @IBAction func exactlyAction(_ sender: Any) {
    }
    
    @IBAction func lessThanAction(_ sender: Any) {
    }
    
    func searching (searchValue: Double, array: [Double]) -> Bool {
        
        var leftIndex = 0
        var rightIndex = array.count - 1
        
        while leftIndex <= rightIndex {
            
            let middleIndex = (leftIndex + rightIndex) / 2
            let middleValue = array[middleIndex]
            
            if middleValue == searchValue {
                testArrayBackup = sortedTests
                sortedTests = [sortedTests[middleIndex]]
                testTableView.reloadData()
                print("yes")
                isSearched = true
                return true
            }
            if searchValue < middleValue {
                rightIndex = middleIndex - 1
            }
            if searchValue > middleValue {
                leftIndex = middleIndex + 1
            }
        }
        return false
    }
    
    func makePercentArray(testArray: [Test]) -> [Double] {
        var percentArray: [Double] = []
        
        for index in 0..<testArray.count {
            percentArray.append(sortedTests[index].percent)
        }
        return percentArray
    }
}
