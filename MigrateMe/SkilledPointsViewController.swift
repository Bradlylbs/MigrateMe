//
//  SkilledPointsViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 1/10/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class SkilledPointsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var eligibility = true
    
    var skilledPoints = SkilledPoints(){
        didSet{
            totalPoints = skilledPoints.totalPoints
        }
    }
    
    var englishLevelAndSwitchHash : [UISwitch : Englishlevel] = [:]
    
    var employmentOutsideAndSwitchHash : [UISwitch : SkilledEmploymentOutsideAustralia] = [:]
    
    var employmentinAndSwitchHash : [UISwitch : SkilledEmploymentInAustralia] = [:]
    
    var qualificationAndSwitchHash : [UISwitch : Qualification] = [:]
    
    var ageband = SkilledPoints.ageBand
    
    var agebandresult : String{
        get{
            if let pickerview = agebandpickerview{
                return ageband[pickerview.selectedRow(inComponent: 0)]
            }
            else{
                return ""
            }
        }
        set{
            if newValue == "Less than 18"{
                let alert = UIAlertController(title: "Remind", message: "You need to be over 18 years old to be eligible for applying skilled immigration visa", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            agebandselectionButton.titleLabel?.text = newValue
            if let result = SkilledPoints.agePointBand[newValue]{
                self.skilledPoints.agePoints = result
                ageScoreLabel.text = "Score: " + "\(result)"
            }
        }
    }
    
    var englishbandresult : Englishlevel{
        get{
            var selectedswitch = UISwitch ()
            for switcher in englishlevelswitches{
                if switcher.isOn{
                    selectedswitch = switcher
                }
            }
            return englishLevelAndSwitchHash[selectedswitch] ?? Englishlevel(point:0)
        }
        set{
            if newValue == SkilledPoints.lessThanCompetentLevel{
                let alert = UIAlertController(title: "Remind", message: "You need to at least get Competent English level to be eligible for applying skilled immigration visa", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            englishscoreLabel.text = "Score: " + "\(newValue.point)"
            skilledPoints.languagePoints = newValue.point
        }
    }
    
    var employmentOutsideresult : SkilledEmploymentOutsideAustralia{
        get{
            var selectedswitch = UISwitch ()
            for switcher in employmentOutsideSwitches{
                if switcher.isOn{
                    selectedswitch = switcher
                }
            }
            return employmentOutsideAndSwitchHash[selectedswitch] ?? SkilledPoints.lessThanThreeYearsOutside
        }
        set{
            employmentOutsideScoreLabel.text = "Score: " + "\(newValue.point)"
            skilledPoints.overseasWorkExperiencePoints = newValue.point
        }
    }
    
    var employmentInresult : SkilledEmploymentInAustralia{
        get{
            var selectedswitch = UISwitch ()
            for switcher in employmentInSwitches{
                if switcher.isOn{
                    selectedswitch = switcher
                }
            }
            return employmentinAndSwitchHash[selectedswitch] ?? SkilledPoints.lessThanOneYearIn
        }
        set{
            employmentInScoreLabel.text = "Score: " + "\(newValue.point)"
            skilledPoints.australianWorkExperiencePoints = newValue.point
        }
    }

    var qualificationresult : Qualification{
        get{
            var selectedswitch = UISwitch ()
            for switcher in qualificationSwitches{
                if switcher.isOn{
                    selectedswitch = switcher
                }
            }
            return qualificationAndSwitchHash[selectedswitch] ?? Qualification(name: "no qualification", point : 0)
        }
        set{
            qualificationScoreLabel.text = "Score: " + "\(newValue.point)"
            skilledPoints.qualificationPoints = newValue.point
        }
    }
    
    var studyRequirementresult : Bool{
        get{
            if studyRequirementSwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.australianStudyPoints = 5
                studyRequirementLabel.text = "Score: 5"
            default:
                skilledPoints.australianStudyPoints = 0
                studyRequirementLabel.text = "Score: 0"
            }
        }
    }
    
    var specialistEducationresult : Bool{
        get{
            if SpeciallistEducationSwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.specialistEducationPoints = 5
                SpeciallistEducationScoreLabel.text = "Score: 5"
            default:
                skilledPoints.specialistEducationPoints = 0
                SpeciallistEducationScoreLabel.text = "Score: 0"
            }
        }
    }
    
    var communityLanguageresult : Bool{
        get{
            if communityLanguageSwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.designatedLanguagePoints = 5
                communityLanguageScoreLabel.text = "Score: 5"
            default:
                skilledPoints.designatedLanguagePoints = 0
                communityLanguageScoreLabel.text = "Score: 0"
            }
        }
    }
    
    var partnerresult : Bool{
        get{
            if PartnerSwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.partnerPoints = 5
                partnerScoreLabel.text = "Score: 5"
            default:
                skilledPoints.partnerPoints = 0
                partnerScoreLabel.text = "Score: 0"
            }
        }
    }
    
    var pyresult : Bool{
        get{
            if pySwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.pyPoints = 5
                pyScoreLabel.text = "Score: 5"
            default:
                skilledPoints.pyPoints = 0
                pyScoreLabel.text = "Score: 0"
            }
        }
    }

    var regionalStudyresult : Bool{
        get{
            if regionalStudySwitch.isOn{
                return true
            }
            else{
                return false
            }
        }
        set{
            switch newValue {
            case true:
                skilledPoints.regionalPoints = 5
                regionalStudyScoreLabel.text = "Score: 5"
            default:
                skilledPoints.regionalPoints = 0
                regionalStudyScoreLabel.text = "Score: 0"
            }
        }
    }


    
    var totalPoints : Int{
        get{
            return skilledPoints.totalPoints
        }
        set{
            PointsDisplayLabel.text = "\(newValue)"
            currentScoreLabel.text = "Your current score is " + "\(newValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preparedata()
        for view in viewGroups{
            view.addVisibleBorder(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
        }
        
        agebandselectionButton.addVisibleBorder(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        agebandselectionButton.titleLabel?.textAlignment = .center
        
    
    }
    
    var agebandpickerview : UIPickerView!
    
    @IBOutlet var viewGroups: [UIView]!
    
    @IBOutlet weak var PointsDisplayLabel: UILabel!
    
    @IBOutlet weak var agebandselectionButton: UIButton!
    
    @IBOutlet weak var ageScoreLabel: UILabel!
    
    @IBOutlet var englishlevelswitches: [UISwitch]!
    
    @IBOutlet weak var englishscoreLabel: UILabel!
    
    @IBOutlet weak var competentswitch: UISwitch!
    
    @IBOutlet weak var superiorswitch: UISwitch!
    
    @IBOutlet weak var proficientswitch: UISwitch!
    
    @IBOutlet weak var lessthancompetentswitch: UISwitch!
    
    @IBOutlet var employmentOutsideSwitches: [UISwitch]!
    
    @IBOutlet weak var lessthan3Switch: UISwitch!
    
    @IBOutlet weak var threetofourSwitch: UISwitch!
    
    @IBOutlet weak var fivetosevenSwitch: UISwitch!
    
    @IBOutlet weak var eighttotenSwitch: UISwitch!
    
    @IBOutlet weak var employmentOutsideScoreLabel: UILabel!
    
    @IBOutlet var employmentInSwitches: [UISwitch]!
    
    @IBOutlet weak var lessthanOneinSwitch: UISwitch!
    
    @IBOutlet weak var onetotwoinSwitch: UISwitch!
    
    @IBOutlet weak var threetofourinSwitch: UISwitch!
    
    @IBOutlet weak var fivetoseveninSwitch: UISwitch!
    
    @IBOutlet weak var eighttoteninSwitch: UISwitch!
    
    @IBOutlet weak var employmentInScoreLabel: UILabel!
    
    @IBOutlet var qualificationSwitches: [UISwitch]!
    
    @IBOutlet weak var doctorSwitch: UISwitch!
    
    @IBOutlet weak var bachelorSwitch: UISwitch!
    
    @IBOutlet weak var diplomaSwitch: UISwitch!
    
    @IBOutlet weak var awardSwitch: UISwitch!
    
    @IBOutlet weak var qualificationScoreLabel: UILabel!
    
    @IBOutlet weak var studyRequirementSwitch: UISwitch!
    
    @IBOutlet weak var studyRequirementLabel: UILabel!
    
    @IBOutlet weak var SpeciallistEducationSwitch: UISwitch!
    
    @IBOutlet weak var SpeciallistEducationScoreLabel: UILabel!
    
    @IBOutlet weak var communityLanguageSwitch: UISwitch!
    
    @IBOutlet weak var communityLanguageScoreLabel: UILabel!
    
    @IBOutlet weak var PartnerSwitch: UISwitch!
    
    @IBOutlet weak var partnerScoreLabel: UILabel!
    
    @IBOutlet weak var pySwitch: UISwitch!
    
    @IBOutlet weak var pyScoreLabel: UILabel!
    
    @IBOutlet weak var regionalStudySwitch: UISwitch!
    
    @IBOutlet weak var regionalStudyScoreLabel: UILabel!
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBAction func agebanSelction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n",message: nil,preferredStyle: .actionSheet)
        
        agebandpickerview = UIPickerView(frame: CGRect.init(x: 10, y: 0, width: alertController.view.bounds.width - 40, height: 150))
        agebandpickerview?.dataSource = self
        agebandpickerview?.delegate = self
        alertController.view.addSubview(agebandpickerview)
        
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: {
            action in
            let index = self.agebandpickerview.selectedRow(inComponent: 0)
            self.agebandresult = self.ageband[index]
        })
        alertController.addAction(doneAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func getEnglishLevel(_ sender: UISwitch) {
        if sender.isOn{
            for switcher in englishlevelswitches{
                if switcher != sender{
                    switcher.isOn = false
                }
            }
            if let result = englishLevelAndSwitchHash[sender]{
                englishbandresult = result
            }
        }
        if !sender.isOn{
            englishbandresult = Englishlevel(point : 0)
        }
    }
    
    @IBAction func getEmploymentOutside(_ sender: UISwitch) {
        if sender.isOn{
            for switcher in employmentOutsideSwitches{
                if switcher != sender{
                    switcher.isOn = false
                }
            }
            if let result = employmentOutsideAndSwitchHash[sender]{
                employmentOutsideresult = result
            }
        }
        else{
            employmentOutsideresult = SkilledEmploymentOutsideAustralia(name : "Less than 3 years", point : 0)
        }
    }
    
    @IBAction func getEmploymentIn(_ sender: UISwitch) {
        if sender.isOn{
            for switcher in employmentInSwitches{
                if switcher != sender{
                    switcher.isOn = false
                }
            }
            if let result = employmentinAndSwitchHash[sender]{
                employmentInresult = result
            }
        }
        else{
            employmentInresult = SkilledEmploymentInAustralia(name : "Less than 1 years", point : 0)
        }

    }
    
    @IBAction func getQualification(_ sender: UISwitch) {
        if sender.isOn{
            for switcher in qualificationSwitches{
                if switcher != sender{
                    switcher.isOn = false
                }
            }
            if let result = qualificationAndSwitchHash[sender]{
                qualificationresult = result
            }
        }
        else{
            qualificationresult = Qualification(name: "no qualification", point : 0)
        }
    }
    
    @IBAction func getSingleSelectionresult(_ sender: UISwitch) {
        var result : Bool
        if sender.isOn{
            result = true
        }
        else {
            result = false
        }

        switch sender {
        case studyRequirementSwitch:
            studyRequirementresult = result
        case SpeciallistEducationSwitch:
            specialistEducationresult = result
        case communityLanguageSwitch:
            communityLanguageresult = result
        case PartnerSwitch:
            partnerresult = result
        case pySwitch:
            pyresult = result
        default:
            regionalStudyresult = result
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageband.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageband[row]
    }
    
    func preparedata() {
        englishLevelAndSwitchHash.updateValue(SkilledPoints.competentLevel, forKey: competentswitch)
        
        englishLevelAndSwitchHash.updateValue(SkilledPoints.proficientLevel, forKey: proficientswitch)
        
        englishLevelAndSwitchHash.updateValue(SkilledPoints.superiorLevel, forKey: superiorswitch)
    
        englishLevelAndSwitchHash.updateValue(SkilledPoints.lessThanCompetentLevel, forKey: lessthancompetentswitch)
        
        employmentOutsideAndSwitchHash.updateValue(SkilledPoints.lessThanThreeYearsOutside, forKey: lessthan3Switch)
        
        employmentOutsideAndSwitchHash.updateValue(SkilledPoints.threetoFourYearsOutside, forKey: threetofourSwitch)
        
        employmentOutsideAndSwitchHash.updateValue(SkilledPoints.fivetoSevenYearsOutside, forKey: fivetosevenSwitch)
        
        employmentOutsideAndSwitchHash.updateValue(SkilledPoints.eighttoTenYearsOutside, forKey: eighttotenSwitch)
        
        employmentinAndSwitchHash.updateValue(SkilledPoints.lessThanOneYearIn, forKey: lessthanOneinSwitch)
        
        employmentinAndSwitchHash.updateValue(SkilledPoints.onetoTwoYearsIn, forKey: onetotwoinSwitch)
        
        employmentinAndSwitchHash.updateValue(SkilledPoints.threetoFourYearsIn, forKey: threetofourinSwitch)
        
        employmentinAndSwitchHash.updateValue(SkilledPoints.fivetoSevenYearsIn, forKey: fivetoseveninSwitch)
        
        employmentinAndSwitchHash.updateValue(SkilledPoints.eighttoTenYearsIn, forKey: eighttoteninSwitch)
        
        qualificationAndSwitchHash.updateValue(SkilledPoints.docotor, forKey: doctorSwitch)
        
        qualificationAndSwitchHash.updateValue(SkilledPoints.bachelor, forKey: bachelorSwitch)
        
        qualificationAndSwitchHash.updateValue(SkilledPoints.diploma, forKey: diplomaSwitch)
        
        qualificationAndSwitchHash.updateValue(SkilledPoints.awardQualification, forKey: awardSwitch)
    }
    
}


extension UIView{
    func addVisibleBorder(color newcolor: CGColor) {
        self.layer.borderColor = newcolor
        
        self.layer.borderWidth = 2
        
        self.layer.cornerRadius = 16
    }
}
