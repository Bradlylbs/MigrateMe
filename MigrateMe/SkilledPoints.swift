//
//  SkilledPoints.swift
//  MigrateMe
//
//  Created by bradlbs on 1/10/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import Foundation

struct SkilledPoints {
    var agePoints = 0
    
    var languagePoints = 0
    
    var australianStudyPoints = 0
    
    var specialistEducationPoints = 0
    
    var regionalPoints = 0
    
    var pyPoints = 0
    
    var qualificationPoints = 0
    
    var overseasWorkExperiencePoints = 0
    
    var australianWorkExperiencePoints = 0
    
    var partnerPoints = 0
    
    var designatedLanguagePoints = 0
    
    var totalPoints : Int{
        return agePoints + languagePoints + australianStudyPoints + specialistEducationPoints + regionalPoints + pyPoints + qualificationPoints + overseasWorkExperiencePoints + australianWorkExperiencePoints + partnerPoints + designatedLanguagePoints
    }
    
    static var ageBand = ["Less than 18", "18 to 24", "25 to 32","33 to 39", "40 to 44"]
    
    static var agePointBand  = ["Less than 18" : 0, "18 to 24" : 25, "25 to 32" : 30, "33 to 39" : 25, "40 to 44" : 15]
    
    static var competentLevel = Englishlevel(name: "Competent English", description: "6+ in all 4 components of IELTS or similar tests", point: 0, eligible: true)
    
    static var proficientLevel = Englishlevel(name: "Proficient English", description: "7+ in all 4 components of IELTS or similar tests", point: 10, eligible: true)
    
    static var superiorLevel = Englishlevel(name: "Superior English", description: "8+ in all 4 components of IELTS or similar tests", point: 20, eligible: true)
    
    static var lessThanCompetentLevel = Englishlevel(name: "Less than competent English", description: "Not eligible to apply 489 visa", point: 0, eligible: false)
    
    static var lessThanThreeYearsOutside = SkilledEmploymentOutsideAustralia(name: "Less than 3 years", point: 0)
    
    static var threetoFourYearsOutside = SkilledEmploymentOutsideAustralia(name: "3 to 4 years", point: 5)
    
    static var fivetoSevenYearsOutside = SkilledEmploymentOutsideAustralia(name: "5 to 7 years", point: 10)
    
    static var eighttoTenYearsOutside = SkilledEmploymentOutsideAustralia(name: "8 to 10 years", point: 15)
    
    static var lessThanOneYearIn = SkilledEmploymentInAustralia(name: "Less than 1 year", point: 0)
    
    static var onetoTwoYearsIn = SkilledEmploymentInAustralia(name: "1 to 2 years", point: 5)
    
    static var threetoFourYearsIn = SkilledEmploymentInAustralia(name: "3 to 4 years", point: 10)
    
    static var fivetoSevenYearsIn = SkilledEmploymentInAustralia(name: "5 to 7 years", point: 15)
    
    static var eighttoTenYearsIn = SkilledEmploymentInAustralia(name: "8 to 10 years", point: 20)
    
    static var awardQualification = Qualification(name: "award", point: 10)
    
    static var diploma = Qualification(name: "diploma", point: 10)
    
    static var bachelor = Qualification(name: "bachelor", point: 15)
    
    static var docotor = Qualification(name: "docotor", point: 20)
    
    
}

struct SkilledEmploymentOutsideAustralia {
    var name : String
    var point : Int
}

struct SkilledEmploymentInAustralia {
    var name : String
    var point : Int
}

struct Englishlevel : Hashable{
    var name : String
    var description : String
    var point : Int
    var eligible : Bool
    
    
    init(point at :Int) {
        self.name = ""
        self.description = ""
        self.point = at
        self.eligible = true
    }
    
    init(name :String, description: String, point: Int, eligible : Bool) {
        self.name = name
        self.description = description
        self.point = point
        self.eligible = eligible
    }
}

struct Qualification {
    var name : String
    var point : Int
}

