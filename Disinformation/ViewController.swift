//
//  ViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 09/03/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//
// References
//  Playing Audio in Swift: 4
//  https://www.hackingwithswift.com/example-code/media/how-to-play-sounds-using-avaudioplayer

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //Outlets for the interface buttins
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var creditButton: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    //For the music player
    // Start 4
    var audioPlayer:AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Round the corners of the buttons and label
        playButton.layer.cornerRadius = 6
        aboutButton.layer.cornerRadius = 6
        creditButton.layer.cornerRadius = 6
        lblTitle.layer.cornerRadius = 6
        
        //Set background
        let background = UIImage(named: "Background")
        
        //Play theme music
        self.playThemeMusic()
        
        //Start 3
        //Set up background
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        //End 3
    }
    
    //When transitioning stop playing the music
    override func viewWillDisappear(_ animated: Bool)
    {
        //Stop playing the music
        self.stopThemeMusic()
    }
    
    //Comment to make sure git is working and a slight change to this comment :).
    
    func playThemeMusic()
    {
        //Get music files
        let file = Bundle.main.path(forResource: "MainMenuTheme", ofType: "m4a")!
        let musicFile = URL(fileURLWithPath: file)
        
        do
        {
            //Play music forever
            audioPlayer = try AVAudioPlayer(contentsOf: musicFile)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        }
        catch //Errors
        {
            print("Could not play theme music")
        }
    }
    
    func stopThemeMusic()
    {
        //StopPlaying the music
        audioPlayer?.stop()
    }
    //End 4
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
        
        //Transition to new storyboard
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
        let message = "Your objective is to convince more than 50% of the public to vote for your side of the campaign. To achieve this goal you can buy campaign assets by using the asset menu. You are against the clock!"
        
        //string for title of pop up box
        let title = "How To Play"
        
        //Make alert pop up and add button
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    //END Home page buttons
}

