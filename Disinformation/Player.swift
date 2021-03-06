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
        self.balance = 8000
    }
    
    func debitPlayerAmount(amount: Int)
    {
        //Debit players balance an amount
        self.balance = self.balance - amount
        
    }
    
    func addAmount(amount: Int)
    {
        //Increase balance by an amount
        self.balance = self.balance + amount
    }
}
