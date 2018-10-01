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
    
    var australianEducationPoints = 0
    
    var specialistEducationPoints = 0
    
    var regionalPoints = 0
    
    var pyPoints = 0
    
    var qualificationPoints = 0
    
    var overseasWorkExperiencePoints = 0
    
    var australianWorkExperiencePoints = 0
    
    var partnerPoints = 0
    
    var designatedLanguagePoints = 0
    
    var totalPoints : Int{
        return agePoints + languagePoints + australianEducationPoints + specialistEducationPoints + regionalPoints + pyPoints + qualificationPoints + overseasWorkExperiencePoints + australianEducationPoints + partnerPoints + designatedLanguagePoints
    }
    
    static var ageBand = ["Less than 18", "18 to 24", "25 to 32","33 to 39", "40 to 44"]
    
    static var agePointBand  = ["Less than 18" : 0, "18 to 24" : 25, "25 to 32" : 30, "33 to 39" : 25, "40 to 44" : 15]
    
    static var englishLevel = ["Competent English", "Proficient English", "Superior Englsih", "Less than Competent Englsih"]
    
    static var englishLevelPoint = ["Competent English" : 0, "Proficient English" : 10, "Superior English" : 20, "Less than Competent Englsih" : 0]
    
    func getTotalPoints() -> Int{
        return agePoints + languagePoints + australianEducationPoints + specialistEducationPoints + regionalPoints + pyPoints + qualificationPoints + overseasWorkExperiencePoints + australianEducationPoints + partnerPoints + designatedLanguagePoints
    }
}

