//  TestOverviewViewController.swift

import UIKit

class TestOverviewViewController: UIViewController {

    @IBOutlet weak var unitTitleLabel: UILabel!
    @IBOutlet weak var amountOfItemsLabel: UILabel!
    @IBOutlet weak var amountCorrectLabel: UILabel!
    @IBOutlet weak var amountIncorrectLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var amountOfQuestionsLabel: UILabel!
    @IBOutlet weak var amountOfDefinitionsLabel: UILabel!
    @IBOutlet weak var personalBestLabel: UILabel!
    @IBOutlet weak var overallAverageLabel: UILabel!
    @IBOutlet weak var stickerImage: UIImageView!
    var stickers: [UIImage] = [#imageLiteral(resourceName: "nice work"), #imageLiteral(resourceName: "very nice"), #imageLiteral(resourceName: "great job"), #imageLiteral(resourceName: "meWOW")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
