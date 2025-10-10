//
//  TriviaViewController.swift
//  Trivia
//
//  Created by June Eguilos on 10/9/25.
//

import UIKit

struct Question{
    let questionNum: Int
    let questionTopic: String
    let question: String
    let buttonOne: String
    let buttonTwo: String
    let buttonThree: String
    let buttonFour: String
    let correctAnswer: String
}



class TriviaViewController: UIViewController {
    @IBOutlet weak var questionLocationLabel: UILabel!
    @IBOutlet weak var topicLocationLabel: UILabel!
    
    @IBOutlet weak var locationButtonOne: UIButton!
    @IBOutlet weak var locationButtonTwo: UIButton!
    @IBOutlet weak var locationButtonThree: UIButton!
    @IBOutlet weak var locationButtonFour: UIButton!
    
    @IBOutlet weak var questionFullLocationLabel: UILabel!
    private var questions = [Question]()
    private var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createMockData()
        configure(with: questions[questionIndex])
        // Do any additional setup after loading the view.
        
    }
    
    private func configure(with question: Question){
        questionLocationLabel.text = "Question \(question.questionNum)/3"
        topicLocationLabel.text = question.questionTopic
        questionFullLocationLabel.text = question.question
        locationButtonOne.setTitle(question.buttonOne, for: .normal)
        locationButtonTwo.setTitle(question.buttonTwo, for: .normal)
        locationButtonThree.setTitle(question.buttonThree, for: .normal)
        locationButtonFour.setTitle(question.buttonFour, for: .normal)
    }
    
    private func createMockData() -> [Question] {
        let fakeData = Question(
            questionNum: 1,
            questionTopic: "Geography",
            question: "What is the capital of France?",
            buttonOne: "Paris",
            buttonTwo: "Berlin",
            buttonThree: "Rome",
            buttonFour: "Madrid",
            correctAnswer: "Paris"
        )
        
        let fakeData2 = Question(
            questionNum: 2,
            questionTopic: "Science",
            question: "What planet is known as the Red Planet?",
            buttonOne: "Mars",
            buttonTwo: "Venus",
            buttonThree: "Jupiter",
            buttonFour: "Mercury",
            correctAnswer: "Mars"
        )

        let fakeData3 = Question(
            questionNum: 3,
            questionTopic: "History",
            question: "Who was the first President of the United States?",
            buttonOne: "George",
            buttonTwo: "Abraham",
            buttonThree: "Thomas",
            buttonFour: "John",
            correctAnswer: "George"
        )

        
        return [fakeData, fakeData2, fakeData3]
    }
    
    
    @IBAction func buttonOneTapped(_ sender: UIButton) {
        print("test")
        showNextQuestion()
    }

    @IBAction func buttonTwoTapped(_ sender: UIButton) {
        showNextQuestion()
    }

    @IBAction func buttonThreeTapped(_ sender: UIButton) {
        showNextQuestion()
    }

    @IBAction func buttonFourTapped(_ sender: UIButton) {
        showNextQuestion()
    }
    
    

    private func showNextQuestion() {
        questionIndex += 1

        if questionIndex < questions.count {
            configure(with: questions[questionIndex])
        } else {
            questionLocationLabel.text = "You finished the quiz!"
            topicLocationLabel.text = ""
            questionFullLocationLabel.text = ""
            locationButtonOne.isHidden = true
            locationButtonTwo.isHidden = true
            locationButtonThree.isHidden = true
            locationButtonFour.isHidden = true
        }
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
