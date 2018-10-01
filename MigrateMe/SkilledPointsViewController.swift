//
//  SkilledPointsViewController.swift
//  MigrateMe
//
//  Created by bradlbs on 1/10/18.
//  Copyright © 2018 吃面包的布拉德. All rights reserved.
//

import UIKit

class SkilledPointsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource{
    
    var skilledPoints = SkilledPoints(){
        didSet{
            totalPoints = skilledPoints.getTotalPoints()
        }
    }
    
    var ageband = SkilledPoints.ageBand
    
    var englishlevel = SkilledPoints.englishLevel
    
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
            agebandselectionButton.titleLabel?.text = newValue
            if let result = SkilledPoints.agePointBand[newValue]{
                self.skilledPoints.agePoints = result
                ageScoreLabel.text = "Score : " + "\(result)"
            }
        }
    }
    
    var totalPoints : Int{
        get{
            return skilledPoints.totalPoints
        }
        set{
            PointsDisplayLabel.text = "\(newValue)"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agebandselectionButton.addVisibleBorder(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        agebandselectionButton.titleLabel?.textAlignment = .center
        
        englishleveltableview.delegate = self
        englishleveltableview.dataSource = self
    
    }
    
    @IBOutlet weak var englishleveltableview: UITableView!
    
    var agebandpickerview : UIPickerView!
    
    @IBOutlet weak var PointsDisplayLabel: UILabel!
    
    @IBOutlet weak var agebandselectionButton: UIButton!
    
    @IBOutlet weak var ageScoreLabel: UILabel!
    
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageband.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageband[row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return englishlevel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = englishleveltableview.dequeueReusableCell(withIdentifier: "englishabilitycell", for: indexPath) as! EnglishLevelTableViewCell
        
        return cell
    }
}

extension UIView{
    func addVisibleBorder(color newcolor: CGColor) {
        self.layer.borderColor = newcolor
        
        self.layer.borderWidth = 2
        
        self.layer.cornerRadius = 16
    }
}
