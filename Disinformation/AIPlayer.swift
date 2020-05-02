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
        super.init()
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
