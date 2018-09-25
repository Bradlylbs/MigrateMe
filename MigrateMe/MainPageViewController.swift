//
//  VisaPageViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 18/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class MainPageViewController: ViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        for button in VisaButtons{
            button.layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.7098039216, blue: 0.7843137255, alpha: 1)
            
            button.layer.borderWidth = 2
            
            button.layer.cornerRadius = 16
        }
        super.viewWillAppear(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var VisaButtons: [UIButton]!
    
    @IBAction func LinktoWebsite(_ sender: UIButton) {
        let url = "https://www.migratemeexperts.com.au/living-expenses"
       
        
        self.openUrl(urlStr: url)
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
