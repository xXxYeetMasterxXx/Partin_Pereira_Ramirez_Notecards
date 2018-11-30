//  ViewFlashcardViewController.swift

import UIKit

class ViewFlashcardViewController: UIViewController {

    @IBOutlet weak var flashcardButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.landscapeLeft.rawValue, forKey: "orientation")
        flashcardButton.backgroundColor = theSubjectArray[number].units[number2].flashcards[number3].colour
    }

    override func viewWillDisappear(_ animated: Bool) {
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
    }
    
}
