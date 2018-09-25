//
//  visitorvisaViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 25/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class visaDetailViewController: UIViewController {

    @IBOutlet var visaViews: [UIView]!
    
    @IBOutlet var visaView: [UIView]!
    
    @IBOutlet weak var studentVisaWebButton: UIButton!
    
    @IBOutlet weak var visitorVisaWebButton: UIButton!
    
    @IBOutlet weak var protectionVisaWebButton: UIButton!
    
    @IBAction func gotoStudentVisaWeb(_ sender: UIButton) {
        if sender == studentVisaWebButton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/student-visa")
        }
        else if sender == visitorVisaWebButton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/vistor-visa")
        }
        else if sender == protectionVisaWebButton{
            openUrl(urlStr: "https://www.migratemeexperts.com.au/protectionvisa-886")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for view in visaView{
            view.layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.7098039216, blue: 0.7843137255, alpha: 1)
            
            view.layer.borderWidth = 2
            
            view.layer.cornerRadius = 16
        }
        super.viewWillAppear(true)
        
    }
    
    @IBAction func backToPreviousPage(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
}
