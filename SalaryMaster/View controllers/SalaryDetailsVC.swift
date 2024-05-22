//
//  SalaryDetailsVC.swift
//  SalaryMaster
//
//  Created by Mac on 15/06/23.
//

import UIKit

class SalaryDetailsVC: UIViewController {

    var AnnualSalary = 0
    var HoursPerWeek = 0
    
    @IBOutlet weak var hSalaryLbl: UILabel!
    @IBOutlet weak var mSalaryLbl: UILabel!
    @IBOutlet weak var wSalaryLbl: UILabel!
    @IBOutlet weak var dSalaryLbl: UILabel!
    @IBOutlet weak var minSalaryLbl: UILabel!
    @IBOutlet weak var sSalaryLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialSetup()
        // Do any additional setup after loading the view.
    }
    
    private func intialSetup() {
        let hourly = AnnualSalary / (HoursPerWeek * 52)
        let monthly = AnnualSalary / 12
        let weekly = AnnualSalary / 52
        let daily = monthly / 30
        let min: Float = Float(hourly / 60)
        let second: Float = Float(min / 60)
        
        hSalaryLbl.text = "\(hourly) /-"
        mSalaryLbl.text = "\(monthly) /-"
        wSalaryLbl.text = "\(weekly) /-"
        dSalaryLbl.text = "\(daily) /-"
        minSalaryLbl.text = "\(min) /-"
        sSalaryLbl.text = "\(second) /-"
    }
    
    @IBAction func backBtnTapped(_ sener: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func MoreBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
