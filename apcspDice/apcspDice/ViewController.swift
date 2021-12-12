//
//  ViewController.swift
//  apcspDice
//
//  Created by Luis Chavez on 2/17/19.
//  Copyright © 2019 BlockchainSavage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
var randomDiceIndex1: Int = 0
var randomDiceIndex2: Int = 0
var score : Int = 0
    
    
@IBOutlet weak var diceImageView1: UIImageView!
@IBOutlet weak var diceImageView2: UIImageView!
@IBOutlet weak var resultLabel: UILabel!
@IBOutlet weak var scoreLabel: UILabel!
override func viewDidLoad() {
super.viewDidLoad()
    
        rollDice()
        //as soon as app loads in random dices appear
  
        
    }

    @IBAction func yesButtonPressed(_ sender: UIButton) {
    //What will happen after yes button is pressed
       
        rollDice()
            if diceImageView1.image == diceImageView2.image {
                resultLabel.text  = "Nice! You rolled doubles!"
                    score = score + 5
                    scoreUpdate()
    
        } else {
           
            resultLabel.text  = "Sorry! You didn't roll doubles."
                score = score - 1
                scoreUpdate()
                //changes score label to the value of the score
                    lossReset()
                    //prevents the score from going below -5 and tells player they lost
            
        }
        
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
       rollDice()
        if diceImageView1.image !== diceImageView2.image
        {
         resultLabel.text   = "Correct, you did not roll doubles!"
           score = score + 1
            scoreUpdate()
            
        } else {
           resultLabel.text = "Sorry! You roled doubles."
            score = score - 5
            scoreUpdate()
            lossReset()
            
        }
        
        
    }
  
    
    func scoreUpdate() {
        scoreLabel.text = "\(score)"
        
    }
    
    func lossReset() {
        if score == -5 || score < -5 {
                score = 0
                    scoreUpdate()
                            rollDice()
                                resultLabel.text = "Incorrect! You lost! Keep Trying"
            
        }
        
    }
    

    
    
    
    
    func rollDice() {
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        //takes data stored in randomDiceIndex and sets it to random number between 0 and 5
        
      
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        /* sets pictures of 2 die to random picture of die by using an array of the image names
        and picking them randomly
    */

 
    }
    
}
