//
//  ViewController.swift
//  TestQuestion
//
//  Created by Сергей Голенко on 09.02.2021.
//

import UIKit

class ViewController: UIViewController {

    
    let list = QuestionBank().list
    var counter = 0
    var score = 0
    var answerBool = false
    var progressPart2 : Float {
        return 1 / Float(self.list.count)
    }
    var progressPart : Float = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            answerBool = true
        } else if sender.tag == 2 {
            answerBool = false
        }
        
        checkAnswer()
        updateUI()
    }
    
    
    func updateUI() {
        if counter <= 12 {
           nextQuestion()
            counter += 1
            progressPart += progressPart2
            print(progressPart)
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    

    func nextQuestion() {
        questionLabel.text = list[counter].questionText
        progressLabel.text = "\(counter + 1)/13"
        scoreLabel.text = "Score: \(score)"
        progressBar.setProgress(progressPart, animated: true)
       
        
        
            
        }
    
    func checkAnswer() {
        if answerBool == list[counter - 1].answer {
            score += 100
        }
    }
    
    
    func startOver() {
       counter = 0
        score = 0
        progressPart = 0
       updateUI()
    }
    


}

