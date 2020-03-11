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
      print("About button clicked.")
    }
    
    @IBAction func CreditsButtonClick(_ sender: UIButton)
    {
        print("Credits clicked")
    }
    //END Home page buttons
}

