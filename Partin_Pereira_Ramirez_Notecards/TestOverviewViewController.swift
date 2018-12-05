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
    var testToDisplay = Test(title: "", amount: 0, correct: 0, percent: 0, amoundOfQuestions: 0, testedUnit: Unit(title: "Unit", flashcards: [], personalBest: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        unitTitleLabel.text = testToDisplay.title
        amountOfItemsLabel.text = String(testToDisplay.amount)
        amountCorrectLabel.text = String(testToDisplay.correct)
        amountIncorrectLabel.text = String(testToDisplay.findIncorrectAndPercent(items: testToDisplay.amount, correct: testToDisplay.correct).0)
        percentLabel.text = String(testToDisplay.percent)
        amountOfQuestionsLabel.text = String(testToDisplay.amoundOfQuestions)
        amountOfDefinitionsLabel.text = String(testToDisplay.findDefinitions(items: testToDisplay.amount, questions: testToDisplay.amoundOfQuestions))
        personalBestLabel.text = String(testToDisplay.testedUnit.personalBest)
        overallAverageLabel.text = String(testToDisplay.findOverallAverage(overallArray: Test.overallAverage))
    }

}
