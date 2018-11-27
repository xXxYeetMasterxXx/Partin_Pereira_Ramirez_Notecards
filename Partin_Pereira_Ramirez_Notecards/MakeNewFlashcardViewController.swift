//  MakeNewFlashcardViewController.swift

import UIKit

class MakeNewFlashcardViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerArray: [String] = ["Note", "Question", "Definition"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    /*func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        <#code#>
    }*/
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var colourButton: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    
    
    
    
    var flashcardMade = Flashcard(title: "", text1: "", text2: "", colour: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), type: .note)
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func colourButtonPressed(_ sender: Any) {
        if colourButton.backgroundColor == #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1){
            colourButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        }
    }

}
