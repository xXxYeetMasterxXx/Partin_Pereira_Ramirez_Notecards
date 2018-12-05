// BrowseViewController.swift

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var BrowseVContButton: UIButton!
    
    var browsedFlipped = false
    
    var counter: Int = 0
    var counter2: Int = 0
    var flashcardsArray: [Flashcard] = []
    
    @IBAction func nextButton(_ sender: Any) {
        
        if (flashcardsArray.count - 1) >= (counter + 1) {
            counter += 1
            BrowseVContButton.setTitle(flashcardsArray[counter].text1, for: .normal)
            browsedFlipped = false
        }
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
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
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
