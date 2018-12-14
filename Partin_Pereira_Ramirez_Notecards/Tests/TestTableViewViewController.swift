//  TestTableViewViewController.swift

import UIKit

class TestTableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    //outlets for the buttons, text field, and table view
    @IBOutlet weak var greaterThanButton: UIButton!
    @IBOutlet weak var exactlyButton: UIButton!
    @IBOutlet weak var lessThanButton: UIButton!
    @IBOutlet weak var percentTextField: UITextField!
    @IBOutlet weak var testTableView: UITableView!
    
    //variables
    var testArrayBackup: [Test] = []
    var isSearched = false
    
    //number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theTestArray.count
    }
    
    //titles and labels for the rows in the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ourCellsTest = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        ourCellsTest.textLabel?.text = "\(theTestArray[indexPath.row].title) Test"
        ourCellsTest.detailTextLabel?.text = "\(theTestArray[indexPath.row].percent)%"
        return ourCellsTest
    }
    
    //assigns a value that determines which row was pressed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number4 = indexPath.row
    }

    //reloads the data
    @IBAction func unwind4(_ sender: UIStoryboardSegue) {
        testTableView.reloadData()
    }
    
    //makes the keyboard disapear when the user presses outside or return
    override func viewDidLoad() {
        super.viewDidLoad()
        self.percentTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    //reloads the table view and resets the variables
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        testTableView.reloadData()
        isSearched = false
        testArrayBackup = theTestArray
        theTestArray = testArrayBackup
    }
    
    //restores the proper value of theTestArray
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        theTestArray = testArrayBackup
    }
    
    //hides the keyboard with return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        percentTextField.resignFirstResponder()
        return true
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
    
    //perfroms a linear searching algorithm that finds all values equal, greater than, or less than the chosen value
    func searching (searchValue: Double, array: [Double], type: Int) {
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
        
        theTestArray = []
        for index in 0..<newTestArray.count {
            theTestArray.append(testArrayBackup[newTestArray[index]])
        }
        testTableView.reloadData()
    }
    
    //makes an array of all of the test scores
    func makePercentArray(testArray: [Test]) -> [Double] {
        var percentArray: [Double] = []
        for index in 0..<testArray.count {
            percentArray.append(theTestArray[index].percent)
        }
        return percentArray
    }
    
    //disables the appropriate buttons then perfroms a searching algotirhtm to find and display the values within the user's criteria, otherwise returns to the normal display and enables the buttons
    func compare(button: UIButton, button2: UIButton, button3: UIButton, type: Int) {
        
        if isSearched == false {
            button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            button2.isEnabled = false
            button3.isEnabled = false
            isSearched = true
            
            guard let safePercent = Double(percentTextField.text!) else {return}
            searching(searchValue: safePercent, array: makePercentArray(testArray: theTestArray), type: type)
        } else {
            button.backgroundColor = #colorLiteral(red: 0.921471417, green: 0.9216262698, blue: 0.9214497209, alpha: 1)
            button2.isEnabled = true
            button3.isEnabled = true
            theTestArray = testArrayBackup
            testTableView.reloadData()
            isSearched = false
        }
    }
    
}
