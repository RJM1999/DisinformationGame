//
//  Player.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation

class Player
{
    var balance: Int
    var activeAssets: [Asset] = []
    var availableAssets: [Asset] = []
    
    init()
    {
        //Set the init balance
        self.balance = 10000
    }
    
    func debitPlayerAmount(amount: Int)
    {
        self.balance = self.balance - amount
        
    }
}
