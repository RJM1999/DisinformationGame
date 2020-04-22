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
        let newSmearImg = UIImage(named: "newssmear.jpeg")
        let radioImg = UIImage(named: "radio.jpeg")
        let questionPanelImg = UIImage(named: "questionpanel.jpeg")
        let rallyImg = UIImage(named: "rally.jpeg")
        
        let twitBot = Asset(name:"Twitter Bots", Desc: "An army of twitter bots that do your bidding",cost: 100,bonus:  10, image: twitbotsImg!)
        let tvCamp = Asset(name:"TV Campaign", Desc: "Party political broadcasts enough to make you change the channel",cost: 50,bonus:  10, image:  tvCampImg!)
        let flyers = Asset(name:"Flyer campaign", Desc: "Post flyers to voters, cheap but often thrown in the bin",cost: 10,bonus:  10, image: flyersImg!)
        let newssmear = Asset(name:"News smear", Desc: "Enlist national newspaper to start a smear against your adversary",cost: 90,bonus:  10, image: newSmearImg!)
        let radio = Asset(name:"Radio Show", Desc: "Head on to the air waves for a radio show",cost: 10,bonus:  10, image: radioImg!)
        let questionPanel = Asset(name:"Question Panel", Desc: "A television show with fellow politicians to answer questions",cost: 10,bonus:  10, image: questionPanelImg!)
        let rally = Asset(name:"Rally", Desc: "Gather fellow supporters and energize the campaign",cost: 10,bonus:  10, image: rallyImg!)
        
        assetList.append(twitBot)
        assetList.append(tvCamp)
        assetList.append(flyers)
        assetList.append(newssmear)
        assetList.append(radio)
        assetList.append(questionPanel)
        assetList.append(rally)
    }
    
}
