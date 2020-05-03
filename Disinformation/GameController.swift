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
    var isPaused = false
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
        
        //Set the available assets
        self.setAvailableAssets()
        
        //Start the timer
        startGameTimer()
        
        //Observers for starting the timers
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(pauseTimer), name: Notification.Name(rawValue: "PauseTimer"), object: nil)
        nc.addObserver(self, selector: #selector(restartTimer), name: Notification.Name(rawValue: "RestartTimer"), object: nil)
        nc.addObserver(self, selector: #selector(aiAssetPurchase(notificationData:)), name: Notification.Name(rawValue: "AIAssetPurchase"), object: nil)
    }
    
    func setAvailableAssets()
    {
        //Set the assets for the ai and real player
        realPlayer.availableAssets = level.assetList
        aiPlayer.availableAssets = level.assetList
    }
    
    func startGameTimer()
    {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(GameController.Tic), userInfo: nil, repeats: true)
    }
    
    @objc func Tic()
    {
        if(self.isPaused == false) //Game is not paused
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
        else
        {
            //Do nothing as the game is paused
            print("Timer paused")
        }
    }
    
    @objc func pauseTimer()
    {
        self.isPaused = true
    }
    
    @objc func restartTimer()
    {
        self.isPaused = false
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
    
    @objc func aiAssetPurchase(notificationData: NSNotification)
    {
        if let assetBought = notificationData.userInfo?["Value"] as? Asset
        {
            self.calculateVoteChange(isAI: true, assetBought: assetBought)
        }
    }
    
    func endGame()
    {
        //Stop the game timer
        self.endGameTimer()
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("Return"), object: nil, userInfo: nil)
        nc.post(name: Notification.Name("EndGame"), object: nil, userInfo: nil)
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
            var newPercentage:Float = (Float(assetBought.assetBonus * self.level.population))
            newPercentage = newPercentage / 10000
            newPercentage = newPercentage * -1
            updateProgressBar(newPercentage: Float(newPercentage))
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
