//
//  GameController.swift
//  Disinformation
//
//  Created by Ross Maider on 08/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation
import UIKit

class GameController
{
    var gameTimer = Timer()
    var monthCounter = 12
    var monthTime = 3
    weak var delegate: ModeleDelgate?
    
    init()
    {
        startGameTimer()
    }
    
    func startGameTimer()
    {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(GameController.Tic), userInfo: nil, repeats: true)
        
        print("timer started")
    }
    
    @objc func Tic()
    {
        if monthTime > 0 //Timer has not ran out
        {
            monthTime -= 1 //Take away one second
        }
        else
        {
            gameTimer.invalidate() //Destroy
            
            monthTime = 10 //Reset seconds
            
            if(monthCounter <= 0) //End of game
            {
                self.endGame()
            }
            else
            {
                monthCounter -= 1 //Decrement month counter by one
                
                updateTimerOnScreen()//Update the timer
                
                self.startGameTimer() //Restart the game timer
            }
        }
    }
    
    func endGameTimer()
    {
        //Stop the timer from ticking
        self.gameTimer.invalidate()
    }
    
    func updateTimerOnScreen()
    {
        //Call view controller update
        delegate?.updateMonth(self.monthCounter)
    }
    
    func endGame()
    {
        //Stop the game timer
        self.endGameTimer()
        delegate?.showMessage("End of game", "The game has finished init")
        print("End of game")
    }
    
    func gameLoop()
    {
        while(monthCounter > 0) //While there is still time to play
        {
        }
        
        print("End the game loop")
        //End game
        self.endGame()
    }
}
 
protocol ModeleDelgate: class
{
    func updateMonth(_ data: Int)
    func showMessage(_ title: String, _ message: String)
}
