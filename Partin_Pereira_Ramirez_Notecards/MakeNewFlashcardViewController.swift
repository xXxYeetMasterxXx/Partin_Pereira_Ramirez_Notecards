//  MakeNewFlashcardViewController.swift

import UIKit

class MakeNewFlashcardViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var numberForPicker = 0
    var flashcardMade = Flashcard(title: "", text1: "", text2: "", colour: .yellow, type: .note)
    var pickerArray: [String] = ["Note", "Question", "Definition"]
    var flashcardColour: Colour = .yellow
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var text1TextView: UITextView!
    @IBOutlet weak var text2TextView: UITextView!
    @IBOutlet weak var colourButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    

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
        if row == 0 {
            text2TextView.isHidden = true
            labelOne.text = "Enter Note:"
            labelTwo.isHidden = true
        } else if row == 1 {
            text2TextView.isHidden = false
            labelOne.isHidden = false
            labelTwo.isHidden = false
            labelOne.text = "Enter Question:"
            labelTwo.text = "Enter Answer:"
        } else {
            text2TextView.isHidden = false
            labelOne.isHidden = false
            labelTwo.isHidden = false
            labelOne.text = "Enter Word:"
            labelTwo.text = "Enter Definition:"
        }
        numberForPicker = row
     }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        flashcardMade = Flashcard(title: titleTextField.text!, text1: text1TextView.text!, text2: text2TextView.text!, colour: flashcardColour, type: flashcardMade.beAType(notePicked: pickerArray[numberForPicker]))
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTextField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
   
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        text1TextView.resignFirstResponder()
        return true
    }
    func textViewShouldReturn2(_ textView: UITextView) -> Bool {
        text2TextView.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        text2TextView.isHidden = true
        labelTwo.isHidden = true
    }
    
    @IBAction func colourButtonPressed(_ sender: Any) {
        if colourButton.backgroundColor == #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            flashcardColour = .orange
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)
            flashcardColour = .pink
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1)
            flashcardColour = .red
        } else if colourButton.backgroundColor == #colorLiteral(red: 1, green: 0.4127538204, blue: 0.350384295, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1)
            flashcardColour = .blue
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.3912315071, green: 0.7174404263, blue: 0.8626636863, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            flashcardColour = .green
        } else if colourButton.backgroundColor == #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) {
            colourButton.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)
            flashcardColour = .yellow
        }
    }
}
