//
//  GameViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 08/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//
// Notes Code Reuse:
// Passing data between view controller GameViewController Class:
// https://fluffy.es/3-ways-to-pass-data-between-view-controllers/#direct
// Table Views AssetViewController class:
// https://stackoverflow.com/questions/33234180/uitableview-example-for-swift

import UIKit

class GameViewController: UIViewController
{
    //Game control class variable
    let gameControl = GameController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Start the game controller class
        gameControl.delegate = self
        
        //Observer for the asset bought
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(assetTest), name: Notification.Name("AssetTest"), object: nil)
    }
    
    //Screen transition for passing data to asset menu (Between view controllers)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "showAssetMenu") //Transition to asset menu
        {
            //Declares new view controller and set the table data to the asset list
            let assetMenuVC = segue.destination as! AssetViewController
            assetMenuVC.tableAssetData = self.gameControl.level.assetList
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
    
    func showMessageDismiss(title: String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func assetTest()
    {
        print("Asset clicked")
    }
    
    @IBAction func assetMenuTapped(_ sender: Any)
    {
        self.performSegue(withIdentifier: "showAssetMenu", sender: self)
    }
    
    @IBOutlet weak var lblMonth: UILabel!
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
}

class AssetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //Empty array for the assets that the player can buy
    var tableAssetData = [Asset]()

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    //For the table view
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        //Remove extra lines
        self.tableView.tableFooterView = UIView()

        // This view controller itself will provide the delegate methods and row data for the table view.
        tableView.delegate = self
        tableView.dataSource = self
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
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!

        // set the text from the data model
        cell.textLabel?.text = self.tableAssetData[indexPath.row].assetName

        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
    }
    
    @IBAction func assetTest(_ sender: Any)
    {
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("AssetTest"), object: nil, userInfo: ["Value":"TestOfbtn"])
        
    }
    
    
}

