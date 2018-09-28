//
//  CourseDetailPageViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 27/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class CourseDetailPageViewController: UIViewController {
    
    var course = BasicData.accountAndFinance
    
    var coursewebsite = ""
    
    @IBOutlet weak var descriptionlabel: UILabel!
    
    @IBOutlet var iconimages: [UIView]!
    
    @IBOutlet weak var websiteButton: UIButton!
    
    @IBAction func gotoWebsite(_ sender: UIButton) {
        openUrl(urlStr: coursewebsite)
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursewebsite = course.website
        descriptionlabel.text? = course.description
        for view in iconimages{
            view.layer.borderColor = #colorLiteral(red: 0.6431372549, green: 0.7098039216, blue: 0.7843137255, alpha: 1)
            
            view.layer.borderWidth = 2
            
            view.layer.cornerRadius = 16
        }
        
    }
    
    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    

}
