//
//  VisaPageViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 18/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class MainPageViewController: ViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in VisaButtons{
            button.layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.7098039216, blue: 0.7843137255, alpha: 1)
            
            button.layer.borderWidth = 2
            
            button.layer.cornerRadius = 16
        }
    }
    
    @IBOutlet var VisaButtons: [UIButton]!
    
    

}
