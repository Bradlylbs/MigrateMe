//
//  Course.swift
//  MigrateMe
//
//  Created by bradlbs on 27/9/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import Foundation

struct Course {
    var name : String
    var category : Category
    var website : String
    var description : String
}

enum Category : String{
    case vet = "Vet Course"
    case college = "College Course"
}

struct Visa {
    var name : String
    var webstie : String
}

struct BasicData {
    static var accountAndFinance = Course(name: "Accounting & Finance", category: Category.college, website: "https://www.migratemeexperts.com.au/accounting-finance",description: "Its a high in demand career where finance and accountancy graduates start working as chartered and certified accountants soon after graduation.")
    
    static var informationTechnology = Course(name: "Information Technology", category: Category.college, website: "https://www.migratemeexperts.com.au/informationtechnology", description: "All the overseas student who wish to come in Australia for study need to apply for admission in a college/ university for student visa. This visa type need some basic steps which needs to follows:")
    
    static var engineering = Course(name: "Engineering", category: Category.college, website: "https://www.migratemeexperts.com.au/engineering", description: "After getting admission in Engineering, students learn about innovation, design, construction, operation and maintenance of structures, machines, device systems, processes and organisation. ")
    
    static var medicineAndNursing = Course(name: "Medicine & Nursing", category: Category.college, website: "https://www.migratemeexperts.com.au/medicine-nursing", description: "A career in the healthcare sector is always rewarding. We offer a range of study options like Div 1 Nurse, Div 2 Nurse,aged care, beauty, personal services, and para-medicine so you can study at diploma, degree or postgraduate level.")
    
    static var architectureAndBuilding = Course(name: "Architecture and Building", category: Category.college, website: "https://www.migratemeexperts.com.au/architecture-building", description: "Across the globe, the construction industry is growing day by day and we are here to help you to build your career in this highly-regarded profession.")
    
    static var cookeryAndHospitalityManagement = Course(name: "Cookery & Hospitality Management", category: Category.vet, website: "https://www.migratemeexperts.com.au/hospitality-cookery", description: "Travel and Tourism industry continues to be one of the world’s largest industries and key drivers of global economic growth, offering a lot of  job options and will take you around the world as its a universal career! ")
    
    static var socialWorkandHumanity = Course(name: "Social Work & Humanity", category: Category.vet, website: "https://www.migratemeexperts.com.au/socialwork-humanity", description: "Social workers, human/social service assistants and administrative or clerical specialists all fall under the category of social and human services workers. ")
    
    static var agricultureAndHorticulture = Course(name: "Agriculture & Horticulture", category: Category.vet, website: "https://www.migratemeexperts.com.au/agriculture-horticulture", description: "If love farming & want to make your farms production up with the latest tools & technologies then Agriculture & Horticulture is the place be.")
    
    static func setvetcourse() -> [Course] {
        let vetCourses = [cookeryAndHospitalityManagement, socialWorkandHumanity, agricultureAndHorticulture]
        return vetCourses
    }
    
    static func setcollegecourse() -> [Course] {
        let collegeCourses = [accountAndFinance, informationTechnology, engineering, medicineAndNursing, architectureAndBuilding]
        return collegeCourses
    }
}

