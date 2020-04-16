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
    
    init()
    {
        self.balance = 10000
        self.debitPlayerAmount(amount: 0)
    }
    
    func debitPlayerAmount(amount: Int)
    {
        self.balance = self.balance - amount
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("BalanceUpdate"), object: nil, userInfo: ["Value": self.balance])
    }
}
