//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by India Doria on 3/27/20.
//  Copyright © 2020 India Doria. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
 
//MARK: - Variables
    var questionIndex = 0
    var answersChosen: [Answer] = []

// MARK: - Outlets
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleSwitch4: UISwitch!
    
    
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    
    
//MARK: - Questions array. All the questions and possible answers are stored here.
    var questions: [Question] = [
        Question(text: "Your friend is having a bad day. What do you do?",
                 type:.single,
                 answers: [
                    Answer(text: "Tell them what their problem is.", type: .carla),
                    Answer(text: "Make a joke of it.", type: .cox),
                    Answer(text: "Avoid them.", type: .turk),
                    Answer(text: "Give them bad advice.", type: .jd)
            ]),
        Question(text: "Your roommate won't stop borrowing your clothes. How do you get them to stop?",
                 type:.single,
                 answers: [
                    Answer(text: "A) It's fine! They look great in your clothes.", type: .jd),
                    Answer(text: "B) Yell at them!", type: .carla),
                    Answer(text: "C) Put itching powder in your clothes. ", type: .cox),
                    Answer(text: "D) Start borrowing their clothes--that'll teach them.", type: .elliott)
            ]),
        Question(text: "Your parents came to visit unannounced. How do you feel?",
                 type:.single,
                 answers: [
                    Answer(text: "A) Like you're five again. *groan* ", type: .elliott),
                    Answer(text: "B) You wish they'd called.", type: .turk),
                    Answer(text: "C) Great! You haven't seen them in a while. ", type: .carla),
                    Answer(text: "D) Surprised. They don't know where you live!.", type: .cox)
            ]),
        Question(text: "Your S.O. has an annoying habit. How do you deal?",
                 type: .single,
                 answers: [
                    Answer(text: "A) Try your best to ignore it. ", type: .elliott),
                    Answer(text: "B) Complain to everyone else about it.", type:.turk),
                    Answer(text: "C) Work the habit into a joke. ", type:.cox),
                    Answer(text: "D) Punish them.", type: .elliott)
            ]),
        Question(text: "You're late for a deadline. How do you catch up?",
                 type:.single,
                 answers: [
                    Answer(text: "A) You decide to wing it. ", type: .jd),
                    Answer(text: "B) Pretend the date was wrong.", type:.turk),
                    Answer(text: "C) Pfft! You'd never be late for a deadline. ", type:.elliott),
                    Answer(text: "D) It'll be ready when it's ready..", type:.cox)
            ]),
        Question(text: "It's your SO's birthday. What do you get them?",
                 type:.single,
                 answers: [
                    Answer(text: "A) You forgot... ", type: .turk),
                    Answer(text: "B) Nothing. They didn't get you anything!", type:.cox),
                    Answer(text: "C) A day filled with their favorite things. ", type:.jd),
                    Answer(text: "D) A romantic dinner.", type:.elliott)
            ]),
        Question(text: "What do you call J.D.?",
                 type: .multiple,
                 answers: [
                    Answer(text: "A) Bambi ", type: .carla),
                    Answer(text: "B) J.D.", type:.elliott),
                    Answer(text: "C) Betty. ", type:.cox),
                    Answer(text: "D) Vanilla Bear.", type:.turk)
            ]),
        
        Question(text: "How much do you like J.D.?",
                 type:.ranged,
                 answers: [
                    Answer(text: "Not at all.", type: .cox),
                      Answer(text: "Meh.", type: .elliott),
                    Answer(text: " You can't help but like him ,even though he's annoying.", type:.carla),
                    Answer(text: "Like? You LOVE him! ", type: .turk),
            ]),
        
        Question(text: "Your best friend just got an embarrassing haircut. What do you do?",
                         type:.single,
                         answers: [
                            Answer(text: "A) You gave them the haircut!", type: .jd),
                            Answer(text: "B) Tease them.", type:.cox),
                            Answer(text: "C) Tell them it looks good anyway. ", type:.elliott),
                            Answer(text: "D) Offer to fix it.", type:.carla)
                ]), Question(text: "You just caught your best friend in a lie. How do you react?",
                             type:.single,
                             answers: [
                                Answer(text: "A) Guilt trip them into telling the truth.", type: .carla),
                                Answer(text: "B) Avoid them.", type:.elliott),
                                Answer(text: "C) Rub it in. ", type:.cox),
                                Answer(text: "D) Ask them why they lied directly.", type:.turk)
                    ]),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     updateUI()
    
        
// MARK: - Navigation
}
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    
    
   
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true

        let currentQuestion = questions[questionIndex]
        let CurrentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: CurrentAnswers)
        case .multiple :
            updateMultipleStack(using: CurrentAnswers)
        case .ranged :
            updateRangedStack(using: CurrentAnswers)
        }
    }
    
    //MARK: - Actions
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    @IBAction func singleAnswerButton(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButton() {
        let currentAnswers = questions[questionIndex].answers
        
        if multipleSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multipleSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    

    @IBAction func rangedAnswerButton() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
}
