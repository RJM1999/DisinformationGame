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
    
    func showMessageDismiss(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func assetMenuOpen(_ sender: Any)
    {
        let currentStoryboard = UIStoryboard(name: "Game", bundle: Bundle.main)
        
        guard let assetStoryboard = currentStoryboard.instantiateViewController(withIdentifier: "AssetViewController") as? AssetViewController else
        {
            print("Could not find game storyboard")
            return
        }
                
        present(assetStoryboard, animated: true, completion: nil)
    }
    
    @IBOutlet weak var lblMonth: UILabel!
}

extension GameViewController: ModeleDelgate
{
    func assetPurchased(_ newAsset: String) {
        
    }
    
    func updateMonth(_ data: Int)
    {
        updateLblMonth(monthCounterInt: data)
    }
    
    func showMessage(_ title: String, _ message: String)
    {
        showMessageDismiss(title: title, message: message)
    }
}

