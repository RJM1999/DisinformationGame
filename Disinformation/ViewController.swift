//
//  ViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 09/03/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var creditButton: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playButton.layer.cornerRadius = 6
        aboutButton.layer.cornerRadius = 6
        creditButton.layer.cornerRadius = 6
        lblTitle.layer.cornerRadius = 6
        
        let background = UIImage(named: "Background")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    //Comment to make sure git is working and a slight change to this comment :).
    
    //START Home page buttons
    @IBAction func PlayButtonClick(_ sender: UIButton)
    {
        print("Play button clicked.")
        
        //Create new game controller object and present new sb
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let gameStoryboard = mainStoryboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else
        {
            print("Could not find game storyboard")
            return
        }
        
        present(gameStoryboard, animated: true, completion: nil)
    
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

