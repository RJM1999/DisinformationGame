//
//  Asset.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation
import UIKit

class Asset
{
    var assetName: String
    var assetDesc: String
    var assetCost: Int
    var assetBonus: Int
    var assetImage: UIImage
    
    init(name: String, Desc: String, cost: Int, bonus: Int, image: UIImage)
    {
        self.assetName = name
        self.assetDesc = Desc
        self.assetCost = cost
        self.assetBonus = bonus
        self.assetImage = image
    }
}
