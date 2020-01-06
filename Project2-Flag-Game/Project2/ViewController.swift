//
//  ViewController.swift
//  Project2
//
//  Created by Montana  on 10/7/19.
//  Copyright © 2019 Montana . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(whenTapped))
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title =  "\(countries[correctAnswer].uppercased()) - SCORE: \(score)"
        questionCount += 1
    }
    
        var questionCount = 0
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
          
            
        }else {
            title = "Wrong"
            score -= 1
            
            
        }
        if questionCount < 5 {
        
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {

            let alertcon = UIAlertController(title: "Game Over" , message: "Your final score is \(score).", preferredStyle: .alert)
            alertcon.addAction(UIAlertAction(title: "Continue! ", style: .default, handler: nil))
            present(alertcon, animated: true)
        }
    
        
}

    @objc func whenTapped() {
        let vc =  UIAlertController(title: "SCORE", message: nil, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Your current score is \(score).", style: .default, handler: nil))
        present(vc, animated: true)
    }
}
