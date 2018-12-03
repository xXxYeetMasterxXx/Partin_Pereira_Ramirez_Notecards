// BrowseViewController.swift

import UIKit

class BrowseViewController: UIViewController {

    @IBOutlet weak var BrowseVContButton: UIButton!
    
    var browsedFlipped = false
    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        BrowseVContButton.backgroundColor = theSubjectArray[number].units[number2].flashcards[number3].colour
        BrowseVContButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        
        
        BrowseVContButton.backgroundColor = theSubjectArray[number].units[number2].flashcards[number3].colour
        theSubjectArray[number].units[number2].flashcards.shuffle()
        BrowseVContButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
        
        if theSubjectArray[number].units[number2].flashcards[number3].type == .note {
            BrowseVContButton.isEnabled = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
   
    
    
    
    @IBAction func browseVContAction(_ sender: Any) {
        if browsedFlipped == false {
            BrowseVContButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text2, for: .normal)
            UIView.transition(with: BrowseVContButton, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            browsedFlipped = true
        } else {
            BrowseVContButton.setTitle(theSubjectArray[number].units[number2].flashcards[number3].text1, for: .normal)
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
