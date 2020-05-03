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
    }
    
    func startTimer()
    {
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
}
