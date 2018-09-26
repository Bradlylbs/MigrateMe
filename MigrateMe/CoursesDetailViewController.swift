//
//  CoursesDetailViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 26/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class CoursesDetailViewController: UIViewController {
    
    @IBOutlet weak var accountingwebbutton: UIButton!
    
    @IBOutlet weak var itwebbutton: UIButton!
    
    @IBOutlet weak var engineeringWebbutton: UIButton!
    
    @IBOutlet weak var cookeryWebbutton: UIButton!
    
    @IBOutlet weak var nursingWebbutton: UIButton!
    
    @IBOutlet weak var buildingWebbutton: UIButton!
    
    @IBOutlet weak var socialWebbutton: UIButton!
    
    @IBOutlet weak var argricultureWebbutton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        for view in requirementsView{
            view.layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.7098039216, blue: 0.7843137255, alpha: 1)
            
            view.layer.borderWidth = 2
            
            view.layer.cornerRadius = 16
        }
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dissmissthispage(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet var requirementsView: [UIView]!
    
    @IBAction func gotoWebsite(_ sender: UIButton) {
        if sender == accountingwebbutton{
            openUrl(urlStr:"https://www.migratemeexperts.com.au/accounting-finance")
        }
        else if sender == itwebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/informationtechnology")
        }
        else if sender == engineeringWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/engineering")
        }
        else if sender == cookeryWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/hospitality-cookery")
        }
        else if sender == buildingWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/architecture-building")
        }
        else if sender == nursingWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/medicine-nursing")
        }
        else if sender == socialWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/socialwork-humanity")
        }
        else if sender == argricultureWebbutton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/agriculture-horticulture")
        }
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
