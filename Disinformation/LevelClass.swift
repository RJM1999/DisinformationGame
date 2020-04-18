//
//  LevelClass.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation
import UIKit

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
        let twitbotsImg = UIImage(named: "twitterbots.jpeg")
        let tvCampImg = UIImage(named: "TVPPB.jpeg")
        let flyersImg = UIImage(named: "flyers.jpeg")
        
        let twitBot = Asset(name:"Twitter Bots", Desc: "An army of twitter bots that do your bidding",cost: 100,bonus:  10, image: twitbotsImg!)
        let tvCamp = Asset(name:"TV Campaign", Desc: "Party political broadcasts enough to make you change the channel",cost: 50,bonus:  10, image:  tvCampImg!)
        let flyers = Asset(name:"Flyer campaign", Desc: "Post flyers to voters, cheap but often thrown in the bin",cost: 10,bonus:  10, image: flyersImg!)
        
        assetList.append(twitBot)
        assetList.append(tvCamp)
        assetList.append(flyers)
    }
    
}
