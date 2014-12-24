//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Rob Percival on 10/07/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var goNumber = 1
    
    var winner = 0
    
    // 0 = empty, 1 = nought, 2 = cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBOutlet var button0 : UIButton!
    
    @IBOutlet var label : UILabel!
    
    @IBOutlet var playAgain : UIButton!
    
    @IBAction func playAgainPressed(sender : AnyObject) {
        
        goNumber = 1
        
        winner = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        label.alpha = 0
        
        playAgain.alpha = 0
        
        var button : UIButton
        
        for var i = 0; i < 9; i++ {
        
        button = view.viewWithTag(i) as UIButton
        
        button.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    
    @IBAction func buttonPressed(sender : AnyObject) {
        
        if (gameState[sender.tag]==0 && winner == 0) {
        
        var image = UIImage()
        
        if (goNumber%2==0) {
            
            image = UIImage(named: "green.png")!
            
            gameState[sender.tag] = 2
            
        } else {
            
            image = UIImage(named: "white.png")!
            
            gameState[sender.tag] = 1
        }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]]==gameState[combination[1]] && gameState[combination[1]]==gameState[combination[2]] && gameState[combination[0]] != 0) {
                
                    winner = gameState[combination[0]]
                
                }
                
            }
            
            if (winner != 0) {
                
                if (winner == 1) {
                    
                    label.text = "White has won!"
                    
                } else {
                    
                    label.text = "Green has won!"
                    
                }
                
                
                UIView.animateWithDuration(0.4, animations: {
                    
                    self.label.alpha = 0.7
                    
                    self.playAgain.alpha = 0.7
                    
                    })
                
            }
            
        
        goNumber++
        
        sender.setImage(image, forState: .Normal)
            
        }
        
    }
    
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        label.alpha = 0
        
        playAgain.alpha = 0
        
    }


}

