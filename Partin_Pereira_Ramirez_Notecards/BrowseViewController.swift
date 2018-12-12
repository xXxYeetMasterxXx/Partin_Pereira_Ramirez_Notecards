// BrowseViewController.swift

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var BrowseVContButton: UIButton!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var browsedFlipped = false
    var counter: Int = 0
    var counter2: Int = 0
    var flashcardsArray: [Flashcard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        counter = 0
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        flashcardsArray = theSubjectArray[number].units[number2].flashcards
        BrowseVContButton.backgroundColor = colourPicker(colour: theSubjectArray[number].units[number2].flashcards[number3].colour)
        flashcardsArray.shuffle()
        BrowseVContButton.setTitle(flashcardsArray[number3].text1, for: .normal)
        if flashcardsArray[number3].type == .note {
            BrowseVContButton.isEnabled = false
        }
        if flashcardsArray.count == 1 {
            nextButton.isEnabled = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if (flashcardsArray.count - 1) >= (counter + 1) {
            counter += 1
            BrowseVContButton.setTitle(flashcardsArray[counter].text1, for: .normal)
            browsedFlipped = false
        } else {
            nextButton.isEnabled = false
        }
        if flashcardsArray[counter].type == .note {
            BrowseVContButton.isEnabled = false
            browsedFlipped = false
        } else {
            BrowseVContButton.isEnabled = true
        }
    }
    
    @IBAction func browseVContAction(_ sender: Any) {
        if browsedFlipped == false {
            BrowseVContButton.setTitle(flashcardsArray[counter].text2, for: .normal)
            UIView.transition(with: BrowseVContButton, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            browsedFlipped = true
        } else {
            BrowseVContButton.setTitle(flashcardsArray[counter].text1, for: .normal)
            UIView.transition(with: BrowseVContButton, duration: 0.5, options: .transitionFlipFromBottom, animations: nil, completion: nil)
            browsedFlipped = false
        }
    }

}
