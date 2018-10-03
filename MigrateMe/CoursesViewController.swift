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
    var courses : [Course]
}

class CoursesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var sections = [Coursegroup]()
    
    var selectedCourse = BasicData.accountAndFinance
    
    lazy var basicdata = BasicData()
    
    let vetCourses = Coursegroup(name: "VET Course", courses: BasicData.setvetcourse())
    
    let collegeCourses = Coursegroup(name: "University Course", courses: BasicData.setcollegecourse())
    

    @IBOutlet weak var coursestableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [vetCourses,collegeCourses]
        coursestableview.delegate = self
        coursestableview.dataSource = self
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
            cell.textLabel?.text = vetCourses.courses[indexPath.row].name
        default:
            cell.textLabel?.text = collegeCourses.courses[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            selectedCourse = vetCourses.courses[indexPath.row]
            performSegue(withIdentifier: "coursedetailpage", sender: self)
        default:
            selectedCourse = collegeCourses.courses[indexPath.row]
            performSegue(withIdentifier: "coursedetailpage", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "coursedetailpage"{
            let destinationvc = segue.destination as? CourseDetailPageViewController
            destinationvc?.course = selectedCourse
            
            destinationvc?.navigationItem.titleView = customizedlabel(name: selectedCourse.name)
        }
    }

    func openUrl(urlStr:String!) {
        
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
}

extension UIViewController {
    var contents: UIViewController{
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        }
        else{
            return self
        }
    }
    
    func customizedlabel(name text : String) -> UILabel{
        let label: UILabel = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = text
        return label
    }
}
