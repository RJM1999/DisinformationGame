//
//  RealPlayer.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation

class RealPlayer: Player
{
    func realPlayerPurchase()
    {
        //Send out a notification so that the player balance is updated
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("BalanceUpdate"), object: nil, userInfo: ["Value": self.balance])
    }
}
