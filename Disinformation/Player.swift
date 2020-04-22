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
        
        //Create a new level object to copy the available assets
        let tempLevel = LevelClass(title: "Dummy Level", desc: "Dummy Level", time: 0, population: 0)
        //Copy the asset array
        self.availableAssets = tempLevel.assetList
    }
    
    func debitPlayerAmount(amount: Int)
    {
        self.balance = self.balance - amount
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("BalanceUpdate"), object: nil, userInfo: ["Value": self.balance])
    }
}
