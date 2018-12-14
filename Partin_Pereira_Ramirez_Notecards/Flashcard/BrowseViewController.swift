// BrowseViewController.swift

import UIKit

class BrowseViewController: UIViewController {

    //makes outlets for stuff
    @IBOutlet weak var BrowseVContButton: UIButton!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    //makes variables for stuff
    var browsedFlipped = false
    var counter: Int = 0
    var counter2: Int = 0
    var flashcardsArray: [Flashcard] = []
    
    //loads a flashcard, upon going on the view controller
    override func viewWillAppear(_ animated: Bool) {
        counter = 0
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        flashcardsArray = theSubjectArray[number].units[number2].flashcards
        flashcardsArray.shuffle()
        BrowseVContButton.backgroundColor = colourPicker(colour: flashcardsArray[counter].colour)
        BrowseVContButton.setTitle(flashcardsArray[counter].text1, for: .normal)
        if flashcardsArray[counter].type == .note {
            BrowseVContButton.isEnabled = false
        }
        if flashcardsArray.count == 1 {
            nextButton.isEnabled = false
        }
    }
    
    //flip the phone back to normal
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
    //take the next flashcard and displays it when next is pressed
    @IBAction func nextButton(_ sender: Any) {
        browsedFlipped = false
        if (flashcardsArray.count - 1) >= (counter + 1) {
            counter += 1
            BrowseVContButton.setTitle(flashcardsArray[counter].text1, for: .normal)
            BrowseVContButton.backgroundColor = colourPicker(colour: flashcardsArray[counter].colour)
        }
        if (flashcardsArray.count - 1) == (counter + 1) {
            nextButton.isEnabled = false
        }
        if flashcardsArray[counter].type == .note {
            BrowseVContButton.isEnabled = false
        } else {
            BrowseVContButton.isEnabled = true
        }
    }
    
    //when flashcard is tapped flip and change to answer and back
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
