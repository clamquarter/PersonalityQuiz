//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by India Doria on 3/27/20.
//  Copyright © 2020 India Doria. All rights reserved.
//

import UIKit



//MARK: - Outlets

class ResultsViewController: UIViewController {
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultsDefLabel: UILabel!
    
    var responses: [Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
navigationItem.hidesBackButton = true
        
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [CharacterType: Int] = [ : ]
        let responseTypes = responses.map { $0.type }
        for response in responseTypes {
            let newCount: Int
            
            if let oldCount = frequencyOfAnswers[response] {
                newCount = oldCount + 1
            } else {
                newCount = 1
            }
            frequencyOfAnswers[response] = newCount
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        resultsDefLabel.text = mostCommonAnswer.definition
    }

    

}
