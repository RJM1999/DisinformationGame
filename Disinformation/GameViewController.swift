//
//  GameViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 08/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//
// Notes Code Reuse:
// Passing data between view controller GameViewController Class: 1
// https://fluffy.es/3-ways-to-pass-data-between-view-controllers/#direct
// Table Views AssetViewController class: 2
// https://stackoverflow.com/questions/33234180/uitableview-example-for-swift

import UIKit
import AVFoundation

class GameViewController: UIViewController
{
    //Game control class variable
    let gameControl = GameController()
    var audioPlayer:AVAudioPlayer?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Start the game controller class
        gameControl.delegate = self
        
        //Observer for the asset bought
        //Start 1
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(assetTest(notificationData:)), name: Notification.Name(rawValue: "AssetTest"), object: nil)
        nc.addObserver(self, selector: #selector(updateLblMoney(notificationData:)), name: Notification.Name(rawValue: "BalanceUpdate"), object: nil)
        nc.addObserver(self, selector: #selector(endGame), name: Notification.Name(rawValue: "EndGame"), object: nil)
        
        //End 1
        lblMoney.text = "Money: £" + String(gameControl.realPlayer.balance)
        lblMonth.text = "Months Remaining: " + String(gameControl.level.timeAllowance)
        
        //turn the progress view vertical
        pvVote.transform = CGAffineTransform(rotationAngle: .pi / -2)
        pvVote.transform = pvVote.transform.scaledBy(x: 1, y: 30)
        
        //Round the corners
        lblMoney.layer.masksToBounds = true
        lblMonth.layer.masksToBounds = true
        lblMoney.layer.cornerRadius = 6
        lblMonth.layer.cornerRadius = 6
        
    }
    
    //Screen transition for passing data to asset menu (Between view controllers)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "showAssetMenu") //Transition to asset menu
        {
            //Declares new view controller and set the table data to the asset list
            let assetMenuVC = segue.destination as! AssetViewController
            assetMenuVC.tableAssetData = self.gameControl.realPlayer.availableAssets
        }
        else if(segue.identifier == "endGameResult")
        {
            let endGameVC = segue.destination as! endGameViewController
            endGameVC.didPlayerWin = calculateResults()
        }
        else
        {
            
        }
    }
    
    func calculateResults() -> String
    {
        //Get value from the vote bar
        let votePercentage = pvVote.progress
        
        if(votePercentage > 0.5) //Player won
        {
            return "player"
        }
        else if(votePercentage == 0.5) //Draw
        {
            return "draw"
        }
        else if(votePercentage < 0.5) //Ai won
        {
            return "ai"
        }
        else //Just in case something went wrong
        {
            return ""
        }
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
    
    func updateNews(newNewsItem: String)
    {
        //News prefix
        let newsPrefix = "BREAKING: "
        
        //Get the current news item
        if(lblNews.text == nil)
        {
            let updatedNews = newsPrefix + newNewsItem
            lblNews.text = updatedNews
        }
        else
        {
            let updatedNews = newsPrefix + newNewsItem
            lblNews.text = updatedNews
        }
        
        self.playNewsThud()
    }
    
    func playNewsThud()
    {
        let file = Bundle.main.path(forResource: "NewsThud", ofType: "m4a")!
        let musicFile = URL(fileURLWithPath: file)
        
        do
        {
            //Play music
            audioPlayer = try AVAudioPlayer(contentsOf: musicFile)
            audioPlayer?.play()
        }
        catch
        {
            print("Could not play news thud")
        }
    }
    
    @objc func updateLblMoney(notificationData: NSNotification)
    {
        //Constant label layout
        var lblMoneyMessage = "Money: £"
        
        //Convert the int month to string so that it can go into the label
        if let newBalanceInt = notificationData.userInfo?["Value"] as? Int
        {
            let moneyString = String(newBalanceInt)
            
            //Concat the strings together
            lblMoneyMessage += moneyString
            
            //Update the text of the label
            lblMoney.text = lblMoneyMessage
        }
    }
    
    func showMessageDismiss(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateProgressBar(newPercentage: Float)
    {
        //Update the progress bar with new percentage (0.6, 0.43 etc)
        print(newPercentage)
        pvVote.setProgress((pvVote.progress + newPercentage), animated: true)
    }
    
    @objc func endGame()
    {
        self.performSegue(withIdentifier: "endGameResult", sender: self)        
    }
    
    @objc func assetTest(notificationData: NSNotification)
    {
        print("Asset clicked")
        
        if let assetClicked = notificationData.userInfo?["Value"] as? Asset
        {
            print(assetClicked.assetName)
            
            //Copy over array
            let oldArray = self.gameControl.realPlayer.availableAssets
            
            //Find the asset in the array of assets
            for (index, currentAsset) in oldArray.enumerated()
            {
                if(currentAsset.assetName == assetClicked.assetName)
                {
                    //Remove asset from the array
                    self.gameControl.realPlayer.availableAssets.remove(at: index)
                    print("Asset removed")
                    
                    //Debit amount from player
                    self.gameControl.realPlayer.debitPlayerAmount(amount: currentAsset.assetCost)
                    
                    //Update the news bar
                    self.updateNews(newNewsItem: "you bought " + currentAsset.assetName)
                    
                    //Update the vote bar
                    self.gameControl.calculateVoteChange(isAI: false, assetBought: assetClicked)
                }
            }
        }
    }
    
    @IBAction func assetMenuTapped(_ sender: Any)
    {
        self.performSegue(withIdentifier: "showAssetMenu", sender: self)
    }
    
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblNews: UILabel!
    @IBOutlet weak var pvVote: UIProgressView!
    
    @IBAction func btnMainMenu(_ sender: Any)
    {
        self.performSegue(withIdentifier: "showMenu", sender: self)
        
        //For stopping the timer
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("PauseTimer"), object: nil, userInfo: nil)
    }
}

extension GameViewController: ModeleDelgate
{
    func updateMonth(_ data: Int)
    {
        updateLblMonth(monthCounterInt: data)
    }
    
    func showMessage(_ title: String, _ message: String)
    {
        showMessageDismiss(title: title, message: message)
    }
    
    func updateProgressBar(_ newPercentage: Float)
    {
        updateProgressBar(newPercentage: newPercentage)
    }
}

class AssetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //Empty array for the assets that the player can buy
    var tableAssetData = [Asset]()

    //Start 2
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    //For the table view
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        //Remove extra lines
        self.tableView.tableFooterView = UIView()

        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //Observer for end of game
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(returnToGame), name: Notification.Name(rawValue: "Return"), object: nil)
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableAssetData.count
    }

    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        // create a new cell if needed or reuse an old one
        let cell:AssetTableCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! AssetTableCell

        // set the text from the data model
        cell.assetName.text = tableAssetData[indexPath.row].assetName
        cell.assetDesc.text = tableAssetData[indexPath.row].assetDesc
        cell.assetCost.text = "Cost £" + String(tableAssetData[indexPath.row].assetCost)
        cell.assetImage.image = tableAssetData[indexPath.row].assetImage
        
        return cell
        
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Get number of row
        let index = indexPath.row
        
        //Disable the cell
        
        //Send notification
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("AssetTest"), object: nil, userInfo: ["Value": tableAssetData[index]])
    }
    
    //End 2
    
    @objc func returnToGame()
    {
        //Closes the popover so the game can end
        self.dismiss(animated: true, completion: nil)
    }
        
}

class AssetTableCell: UITableViewCell
{
    @IBOutlet weak var assetName: UILabel!
    @IBOutlet weak var assetDesc: UILabel!
    @IBOutlet weak var assetCost: UILabel!
    @IBOutlet weak var assetImage: UIImageView!
    
}

class menuViewControlller: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        btnResume.layer.cornerRadius = 6
        btnExit.layer.cornerRadius = 6
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("RestartTimer"), object: nil, userInfo: nil)
    }
    
    @IBOutlet weak var btnResume: UIButton!
    @IBOutlet weak var btnExit: UIButton!
    
    @IBAction func returnToGame(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
        
        //Restarting the timer
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("RestartTimer"), object: nil, userInfo: nil)
    }
    
    @IBAction func showMainMenu(_ sender: Any)
    {
        //TODO
    }
}

class endGameViewController: UIViewController
{
    var didPlayerWin: String = ""
    
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var lblResultsText: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        processResults()
    }
    
    @IBAction func returnToMainMenuBtn(_ sender: Any)
    {
        self.performSegue(withIdentifier: "endGameReturn", sender: self)
    }
    
    func processResults()
    {
        
    }
}

