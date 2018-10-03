//
//  NewMainPageViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 3/10/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class NewMainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let visaimage = UIImage(named: "Visabackground")?.alpha(0.3)
        visaButton.setBackgroundImage(visaimage, for: .normal)
        
        let courseimage = UIImage(named: "CourseBackground")?.alpha(0.3)
        courseButton.setBackgroundImage(courseimage, for: .normal)
        
        let livingInAusimage = UIImage(named: "LivinginAusBackground")?.alpha(0.3)
        livingInAus.setBackgroundImage(livingInAusimage, for: .normal)
        
        let skilledPointsimage = UIImage(named: "SkilledCalculatorBackground")?.alpha(0.3)
        SkilledPoints.setBackgroundImage(skilledPointsimage, for: .normal)
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var visaButton: UIButton!
    
    @IBOutlet weak var courseButton: UIButton!
    
    @IBOutlet weak var livingInAus: UIButton!
    
    @IBOutlet weak var SkilledPoints: UIButton!
    
    
    @IBOutlet var buttons: [UIButton]!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
