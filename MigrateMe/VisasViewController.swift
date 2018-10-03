//
//  VisasViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 21/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class VisasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var visastableview: UITableView!
    
    var visas = ["Student Visa", "Vistor Visa", "Skilled Migration Visa","Family and Parents Visa", "MRT/AAT Appeal", "Business Visa", "Protection Visa 886", "Employer Sponsered Visa","Partner Visa"]
    
    var websites = ["https://www.migratemeexperts.com.au/student-visa", "https://www.migratemeexperts.com.au/vistor-visa", "https://www.migratemeexperts.com.au/general-skilled-migration-visa", "https://www.migratemeexperts.com.au/parnets-partner-visa", "https://www.migratemeexperts.com.au/mrt-aat-appeal", "https://www.migratemeexperts.com.au/business-visa", "https://www.migratemeexperts.com.au/protectionvisa-886", "https://www.migratemeexperts.com.au/employer-sponser-visa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visastableview.delegate = self
        visastableview.dataSource = self
        // Do any additional setup after loading the view.
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisaCell", for: indexPath)
        
        cell.textLabel?.text = visas[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let url = websites[indexPath.row]
        //self.openUrl(urlStr: url)
        let segue = visas[indexPath.row]
        self.performSegue(withIdentifier: segue, sender: nil)
        //self.performSegue(withIdentifier: "visitorvisa", sender: nil)
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dc = segue.destination
        dc.navigationItem.title = segue.identifier
    }

}
