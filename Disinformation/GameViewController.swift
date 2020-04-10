//
//  GameViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 08/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//
import UIKit

class GameViewController: UIViewController
{
    let gameControl = GameController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Start the game controller class
        gameControl.delegate = self
    }
    
    @objc func updateLblMonth(monthCounterInt: Int)
    {
        //Constant label layout
        var lblMonthMessage = "Months Remaining: "
        //Convert the int month to string so that it can go into the label
        let monthCounterString = String(monthCounterInt)
        //Concat the strings together
        lblMonthMessage += monthCounterString
        
        //Update the text of the label
        lblMonth.text = lblMonthMessage
    }

    @IBOutlet weak var lblMonth: UILabel!
}

extension GameViewController: ModeleDelgate
{
    func recieveData(_ data: Int) {
        updateLblMonth(monthCounterInt: data)
    }
}

