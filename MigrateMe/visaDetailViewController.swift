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
    
    override func viewWillAppear(_ animated: Bool) {
        for view in visaViews{
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
    
}
