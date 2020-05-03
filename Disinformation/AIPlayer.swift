//
//  AIPlayer.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation

class AIPlayer: Player
{
    var aiTimer = Timer()
    var isPaused = false
    
    override init()
    {
        //Call the super class constructor
        super.init()
        //Start the timer
        startTimer()
        
        //Observer for the
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(pauseAITimer), name: Notification.Name(rawValue: "PauseTimer"), object: nil)
        nc.addObserver(self, selector: #selector(restartAITimer), name: Notification.Name(rawValue: "RestartTimer"), object: nil)
        nc.addObserver(self, selector: #selector(endAITimer), name: Notification.Name(rawValue: "EndGame"), object: nil)
    }
    
    func startTimer()
    {
        //Start the timer with 
       aiTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(AIPlayer.tic), userInfo: nil, repeats: true)
    }
    
    @objc func tic()
    {
        if(isPaused == false) //Game is not paused
        {
            
        }
        else //Game is paused
        {
            
        }
    }
    
    @objc func pauseAITimer()
    {
        self.isPaused = true
    }
    
    @objc func restartAITimer()
    {
        self.isPaused = false
    }
    
    @objc func endAITimer()
    {
        //Pause and kill the timer
        self.pauseAITimer()
        self.aiTimer.invalidate()
    }
    
    func generateRandomNumber()
    {
        //Generate new random number
    }
    
    func aiPurchase()
    {
        //Function for randomly choosing an asset
        //Get an array of the all the available assets that the ai can afford
        
        var possibleAsset = [Asset]()
        
        for asset in self.availableAssets
        {
            if(asset.assetCost <= self.balance) //Can afford
            {
                //Add the new asset to the possible asset array
                possibleAsset.append(asset)
            }
        }
        
        //Chose random asset from the list
        if(possibleAsset.count <= 0)
        {
            //Check for empty array
        }
        else
        {
            let newAsset = possibleAsset.randomElement()
            
            if(newAsset != nil) //Safety check for nil
            {
                //Copy over array
                let oldArray = self.availableAssets
                
                //Find the asset in the array of assets
                for (index, currentAsset) in oldArray.enumerated()
                {
                    if(currentAsset.assetName == newAsset!.assetName)
                    {
                        //Remove asset from the array
                        self.availableAssets.remove(at: index)
                        
                        debitPlayerAmount(amount: newAsset!.assetCost)
                        
                        //Post notification of ai purchase so game controller and news can process it
                        let nc = NotificationCenter.default
                        nc.post(name: Notification.Name("AIAssetPurchase"), object: nil, userInfo: ["Value":newAsset!])
                    }
                }
            }
            else
            {
                print("Problem with AI asset purchase seems to be nil")
            }
        }
        
    }
}
