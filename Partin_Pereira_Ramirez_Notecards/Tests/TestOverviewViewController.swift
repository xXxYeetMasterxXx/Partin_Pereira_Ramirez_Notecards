//  TestOverviewViewController.swift

import UIKit

class TestOverviewViewController: UIViewController {
    
    //outlets for all of the labels and the sticker
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
    
    //variables to store the stickers and the test being displayed
    var stickers: [UIImage] = [#imageLiteral(resourceName: "try again"), #imageLiteral(resourceName: "nice work"), #imageLiteral(resourceName: "very nice"), #imageLiteral(resourceName: "great job"), #imageLiteral(resourceName: "meWOW")]
    var testToDisplay = Test(title: "", amount: 0, correct: 0, percent: 0, amoundOfQuestions: 0, testedUnit: Unit(title: "Unit", flashcards: [], personalBest: 0))
    
    //displays information about the test and displays a sticker according to the score
    override func viewWillAppear(_ animated: Bool) {
        unitTitleLabel.text = testToDisplay.title
        amountOfItemsLabel.text = String(testToDisplay.amount)
        amountCorrectLabel.text = String(testToDisplay.correct)
        amountIncorrectLabel.text = String(testToDisplay.findIncorrect(items: testToDisplay.amount, correct: testToDisplay.correct))
        percentLabel.text = "\(testToDisplay.percent)%"
        amountOfQuestionsLabel.text = String(testToDisplay.amoundOfQuestions)
        amountOfDefinitionsLabel.text = String(testToDisplay.findDefinitions(items: testToDisplay.amount, questions: testToDisplay.amoundOfQuestions))
        personalBestLabel.text = "\(testToDisplay.testedUnit.personalBest)%"
        overallAverageLabel.text = "\(testToDisplay.findOverallAverage(overallArray: Test.overallAverage))%"
        switch testToDisplay.percent {
        case 0 ... 49.9:
            stickerImage.image = stickers[0]
        case 50 ... 69.9:
            stickerImage.image = stickers[1]
        case 70 ... 79.9:
            stickerImage.image = stickers[2]
        case 100:
            stickerImage.image = stickers[4]
        default:
            stickerImage.image = stickers[3]
        }
    }

}
