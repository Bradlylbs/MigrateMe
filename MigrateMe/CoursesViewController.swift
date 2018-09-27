//
//  CoursesViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 21/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

struct Coursegroup {
    let name : String
    var courses : [String]
}

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var sections = [Coursegroup]()
    
    //var courses = ["Accounting & Finance", "Information Technology", "Engineering", "Cookery & Hospitality Management", "Medicine & Nursing", "Architecuture and Building", "Social Work & Humanity", "Agriculture & Horticulture"]
    
    var vetCourses = Coursegroup(name: "Vet Course", courses:["Cookery & Hospitality Management", "Social Work & Humanity", "Agriculture & Horticulture"])
    
    var collegeCourses = Coursegroup(name: "College Course", courses:["Accounting & Finance", "Information Technology", "Engineering", "Medicine & Nursing", "Architecture and Building"])
    
    //var coursewebsite = ["https://www.migratemeexperts.com.au/accounting-finance", "https://www.migratemeexperts.com.au/informationtechnology", "https://www.migratemeexperts.com.au/engineering", "https://www.migratemeexperts.com.au/hospitality-cookery", "https://www.migratemeexperts.com.au/medicine-nursing", "https://www.migratemeexperts.com.au/architecture-building", "https://www.migratemeexperts.com.au/socialwork-humanity", "https://www.migratemeexperts.com.au/agriculture-horticulture"]

    @IBOutlet weak var coursestableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [vetCourses,collegeCourses]
        coursestableview.delegate = self
        coursestableview.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return vetCourses.courses.count
        default:
            return collegeCourses.courses.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = vetCourses.courses[indexPath.row]
        default:
            cell.textLabel?.text = collegeCourses.courses[indexPath.row]
        }
        //cell.textLabel?.text = courses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let url = coursewebsite[indexPath.row]
        self.openUrl(urlStr: url)*/
        switch indexPath.section {
        case 0:
            let identifier = vetCourses.courses[indexPath.row]
            self.performSegue(withIdentifier: identifier, sender: nil)
        default:
            let identifier = collegeCourses.courses[indexPath.row]
            self.performSegue(withIdentifier: identifier, sender: nil)
        }
        //let identifier = collegeCourses.courses[indexPath.row]
        //self.performSegue(withIdentifier: identifier, sender: nil)
    }

    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
}
