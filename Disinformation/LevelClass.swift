//
//  LevelClass.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation

class LevelClass
{
    var title: String
    var desc: String
    var timeAllowance: Int
    var population: Int
    var assetList: [Asset] = []
    
    init(title: String, desc: String, time: Int, population: Int)
    {
        self.title = title
        self.desc = desc
        self.timeAllowance = time
        self.population = population
        
        makeAsset()
    }
    
    func makeAsset()
    {
        let twitBot = Asset(name:"Twitter Bots", Desc: "An army of twitter bots that do your bidding",cost: 2,bonus:  10)
        let tvCamp = Asset(name:"TV Campaign", Desc: "Party political broadcasts",cost: 2,bonus:  10)
        let flyers = Asset(name:"Flyer campaign", Desc: "Post flyers to voters",cost: 2,bonus:  10)
        
        assetList.append(twitBot)
        assetList.append(tvCamp)
        assetList.append(flyers)
    }
    
}
