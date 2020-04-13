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
    
    init(title: String, desc: String, time: Int, population: Int, list: [Asset])
    {
        self.title = title
        self.desc = desc
        self.timeAllowance = time
        self.population = population
        self.assetList = list
    }
    
}
