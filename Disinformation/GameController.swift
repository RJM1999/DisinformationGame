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
    var level = LevelClass(title: "Brexit", desc: "Brexit campaign", time: 12, population: 55)
    var realPlayer = RealPlayer()
    var aiPlayer = AIPlayer()
    
    init()
    {
        //Get month allowance from the level class
        monthCounter = level.timeAllowance
        
        //Start the timer
        startGameTimer()
    }
    
    func startGameTimer()
    {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(GameController.Tic), userInfo: nil, repeats: true)
        
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
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("Return"), object: nil, userInfo: nil)
        delegate?.showMessage("End of game", "The game has finished init")
        print("End of game")
    }
    
    func calculateVoteChange(isAI: Bool, assetBought: Asset)
    {
        //If the player bought the asset
        if(isAI == false)
        {
            var newPercentage:Float = (Float(assetBought.assetBonus * self.level.population))
            newPercentage = newPercentage / 10000
            updateProgressBar(newPercentage: Float(newPercentage))
        }
        else //AI Purchase
        {
            
        }
    }
    
    func updateProgressBar(newPercentage: Float)
    {
        delegate?.updateProgressBar(newPercentage)
    }
}
 
protocol ModeleDelgate: class
{
    func updateMonth(_ data: Int)
    func showMessage(_ title: String, _ message: String)
    func updateProgressBar(_ newPercentage: Float)
}
