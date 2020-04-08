//
//  GameController.swift
//  Disinformation
//
//  Created by Ross Maider on 08/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation

class GameController
{
    var gameTimer = Timer()
    var monthCounter = 12
    var monthTime = 10
    
    init()
    {
        print("Init class...")
        startGameTimer()
    }
    
    func startGameTimer()
    {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameController.Tic), userInfo: nil, repeats: true)
        
        print("The game timer has started!")
    }
    
    @objc func Tic()
    {
        if monthTime > 0
        {
            monthTime -= 1
            print("Tic Toc")
        }
        else
        {
            gameTimer.invalidate()
            print("End of timer")
        }
    }
    
    func updateTimer()
    {
        //Call view controller update
    }
    
    func gameLoop()
    {
        while(monthCounter > 0) //While there is still time to play
        {
            
        }
    }
 
}
 

