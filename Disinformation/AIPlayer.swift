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
    
    override init()
    {
        //Call the super class constructor
        super.init()
        //Start the timer
        startTimer()
    }
    
    func startTimer()
    {
       aiTimer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(AIPlayer.tic), userInfo: nil, repeats: true)
    }
    
    @objc func tic()
    {
        
    }
}
