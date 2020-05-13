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
        
        //Set up assets
        makeAsset()
    }
    
    func makeAsset()
    {
        //Images for the assets
        let twitbotsImg = UIImage(named: "twitterbots.jpeg")
        let tvCampImg = UIImage(named: "TVPPB.jpeg")
        let flyersImg = UIImage(named: "flyers.jpeg")
        let newSmearImg = UIImage(named: "newssmear.jpeg")
        let radioImg = UIImage(named: "radio.jpeg")
        let questionPanelImg = UIImage(named: "questionpanel.jpeg")
        let rallyImg = UIImage(named: "rally.jpeg")
        let doorstepsImg = UIImage(named: "Doorsteps.jpeg")
        let partyBusImg = UIImage(named: "Party bus.jpeg")
        let profileImg = UIImage(named: "Profiling.jpeg")

        
        //Make assets variables
        let twitBot = Asset(name:"Twitter Bots", Desc: "An army of twitter bots that do your bidding",cost: 3750,bonus:  14, image: twitbotsImg!)
        let tvCamp = Asset(name:"TV Campaign", Desc: "Party political broadcasts enough to make you change the channel",cost: 1500,bonus:  7, image:  tvCampImg!)
        let flyers = Asset(name:"Flyer campaign", Desc: "Post flyers to voters, cheap but often thrown in the bin",cost: 500,bonus:  9, image: flyersImg!)
        let newssmear = Asset(name:"News smear", Desc: "Enlist national newspaper to start a smear against your adversary",cost: 6000,bonus:  36, image: newSmearImg!)
        let radio = Asset(name:"Radio Show", Desc: "Head on to the air waves for a radio show",cost: 1000,bonus:  5, image: radioImg!)
        let questionPanel = Asset(name:"Question Panel", Desc: "A television show with fellow politicians to answer questions",cost: 4500,bonus:  27, image: questionPanelImg!)
        let rally = Asset(name:"Rally", Desc: "Gather fellow supporters and energize the campaign",cost: 2500,bonus:  20, image: rallyImg!)
        let doorstep = Asset(name:"Doorstep Campaign", Desc: "Go round the doors across the country",cost: 300,bonus:  5, image: doorstepsImg!)
        let partybus = Asset(name:"Bus", Desc: "Drive up and down the country in a bus with interesting slogans",cost: 3000,bonus:  21, image: partyBusImg!)
        let profiling = Asset(name:"Voter Profiling", Desc: "Employ a little know company to garner information on voters (With or without their consent)",cost: 2000,bonus:  20, image: profileImg!)
        
        //Add assets to the levels asset list
        assetList.append(twitBot)
        assetList.append(tvCamp)
        assetList.append(flyers)
        assetList.append(newssmear)
        assetList.append(radio)
        assetList.append(questionPanel)
        assetList.append(rally)
        assetList.append(doorstep)
        assetList.append(partybus)
        assetList.append(profiling)
    }
    
}
