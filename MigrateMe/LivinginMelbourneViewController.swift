//
//  LivinginMelbourneViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 26/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class LivinginMelbourneViewController: UIViewController {

    @IBAction func livinginMelbourneWebsite(_ sender: UIButton) {
        let urlStr = "https://www.migratemeexperts.com.au/living-expenses"
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    @IBOutlet weak var websiteButton: UIButton!{
        didSet{
            websiteButton.titleLabel?.numberOfLines = 0
        }
    }
    
}
