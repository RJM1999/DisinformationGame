//
//  ViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 09/03/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Comment to make sure git is working and a slight change to this comment :).
    
    //START Home page buttons
    @IBAction func PlayButtonClick(_ sender: UIButton)
    {
        print("Play button clicked.")
    
    }
    
    @IBAction func AboutButtonClick(_ sender: UIButton)
    {
        //string for the message box contents
        let message = "Disinformation is all about modern day political campaigns and what tactics they employ to persuede the public. You are able to choose which side you play for and an AI controls the other, its a countdown till polling day!"
        
        //string for title of pop up box
        let title = "About Disinformation"
        
        //Make alert pop up and add button
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func CreditsButtonClick(_ sender: UIButton)
    {
        //string for the message box contents
        let message = "All relevant credits to go here"
        
        //string for title of pop up box
        let title = "Credits"
        
        //Make alert pop up and add button
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    //END Home page buttons
}

