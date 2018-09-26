//
//  EmployerSponseredViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 25/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class EmployerSponseredViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func gotoweb(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/employer-sponser-visa")
    }
    
    @IBAction func gotoSkilledWeb(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/general-skilled-migration-visa")
    }
    
    @IBAction func gotoFamilyPage(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/parnets-partner-visa")
    }
    
    @IBAction func gotoMRTWeb(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/mrt-aat-appeal")
    }
    
    @IBAction func gotoBusinessWeb(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/business-visa")
    }
    
    @IBAction func gotoPartnerWeb(_ sender: UIButton) {
        openUrl(urlStr: "https://www.migratemeexperts.com.au/partnervisa")
    }
    
    @IBAction func backtoMainPate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
}
