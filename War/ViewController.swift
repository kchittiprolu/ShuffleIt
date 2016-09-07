//
//  ViewController.swift
//  War
//
//  Created by Karthik Chittiprolu  on 9/5/16.
//  Copyright © 2016 CodeWithKarthik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var attemptsLabel: UILabel!
    
    var playerScore:Int = 0
    
    @IBOutlet weak var enemyScoreLabel: UILabel!
    var enemyScore:Int = 0
    
    var attempts:Int = 0
    var result:String = ""
    
    var cardNamesArray:[String] = ["card2","card3","card4","card5","card6","card7","card8","card9"
    ,"card10","jack","king","queen","ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRoundTapped(sender: UIButton) {
        
        self.attempts += 1
        self.attemptsLabel.text = String(format: "Attempts:%i/10", self.attempts)
        self.resultLabel.text = String("")
        
        if self.attempts == 10 {
            
            self.attempts = 0
            
            if(self.playerScore > self.enemyScore){
                self.result = "You Win!"
            }
            else if(self.playerScore == self.enemyScore){
                self.result = "It's a Tie"
            }
            else{
                self.result = "You Lose :("
            }
            
            self.resultLabel.text = String(self.result)
            self.playerScore = 0
            self.enemyScore = 0
            self.playerScoreLabel.text = String(self.playerScore)
            self.enemyScoreLabel.text = String(self.enemyScore)
        }
        else{
        //Randomize a number for the first image view
        let firstRandomNumber:Int = Int(arc4random_uniform(13))
        
        //construct a string with random number
        let firstCard:String = self.cardNamesArray[firstRandomNumber]
        
        //set first card image view with corresponding asset from the generated random number
        self.firstCardImageView.image = UIImage(named: firstCard)
        
        //Randomize a number for the second image view
        let secondRandomNumber:Int = Int(arc4random_uniform(13))
        
        //construct a string with random number
        let secondCard:String = self.cardNamesArray[secondRandomNumber]
        
        //set first card image view with corresponding asset from the generated random number
        self.secondCardImageView.image = UIImage(named: secondCard)
        
        if firstRandomNumber > secondRandomNumber{
            //TODO: first is greated
            self.playerScore += 1
            self.playerScoreLabel.text = String(self.playerScore)
        }
        else if firstRandomNumber == secondRandomNumber{
            //TODO: numbers are equal
        }
        else{
            //TODO: second is greated
            self.enemyScore += 1
            self.enemyScoreLabel.text = String(self.enemyScore)
        }
        }
    }
}

