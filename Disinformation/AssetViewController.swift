//
//  AssetViewController.swift
//  Disinformation
//
//  Created by Ross Maider on 13/04/2020.
//  Copyright © 2020 Ross Maider. All rights reserved.
//

import Foundation
import UIKit

class AssetViewController: UIViewController
{
    weak var mainViewUpdater: updateGameMenuFromAsset?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}

protocol updateGameMenuFromAsset: class
{
    func newAssetPurchases(newAsset: String)
}
