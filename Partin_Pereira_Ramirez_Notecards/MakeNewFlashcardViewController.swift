//  MakeNewFlashcardViewController.swift

import UIKit

class MakeNewFlashcardViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var flashcardMade = Flashcard(title: "", text1: "", text2: "", colour: #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1), type: .note)
    var pickerArray: [String] = ["Note", "Question", "Definition"]
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var text1TextView: UITextView!
    @IBOutlet weak var text2TextView: UITextView!
    @IBOutlet weak var colourButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        number3 = row
     }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        flashcardMade = Flashcard(title: titleTextField.text!, text1: text1TextView.text!, text2: text2TextView.text!, colour: colourButton.backgroundColor!, type: flashcardMade.beAType(notePicked: pickerArray[number3]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func colourButtonPressed(_ sender: Any) {
        if colourButton.backgroundColor == #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
        }
    }

}
