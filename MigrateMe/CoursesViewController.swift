//
//  CoursesViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 21/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var courses = ["Accounting & Finance", "Information Technology", "Engineering", "Cookery & Hospitality Management", "Medicine & Nursing", "Architecuture and Building", "Social Work & Humanity", "Agriculture & Horticulture"]
    
    var coursewebsite = ["https://www.migratemeexperts.com.au/accounting-finance", "https://www.migratemeexperts.com.au/informationtechnology", "https://www.migratemeexperts.com.au/engineering", "https://www.migratemeexperts.com.au/hospitality-cookery", "https://www.migratemeexperts.com.au/medicine-nursing", "https://www.migratemeexperts.com.au/architecture-building", "https://www.migratemeexperts.com.au/socialwork-humanity", "https://www.migratemeexperts.com.au/agriculture-horticulture"]

    @IBOutlet weak var coursestableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursestableview.delegate = self
        coursestableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backtomainpage(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        
        cell.textLabel?.text = courses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = coursewebsite[indexPath.row]
        self.openUrl(urlStr: url)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
}