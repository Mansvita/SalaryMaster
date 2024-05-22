//
//  SalaryVC.swift
//  SalaryMaster
//
//  Created by Mac on 15/06/23.
//

import UIKit

class SalaryVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var annualTxt: UITextField!
    @IBOutlet weak var hoursPerWeekTxt: UITextField!
    @IBOutlet weak var calulatebtn: UIButton!
    
//    var ipay: Int = 0
//    var ihave: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        annualTxt.delegate = self
        hoursPerWeekTxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        annualTxt.resignFirstResponder()
        hoursPerWeekTxt.resignFirstResponder()
        return true
    }


    @IBAction func calulatorBtnTapped(_ sender: Any) {
        if annualTxt.text == "" || hoursPerWeekTxt.text == "" {
            showToast(message: "Enter Detils", font: .systemFont(ofSize: 20))
            return
        }else {
            if let annualString = annualTxt.text, let hoursPerWeekString = hoursPerWeekTxt.text {
                if let iannual = Int(annualString), let ihoursPerWeek = Int(hoursPerWeekString) {
                    // Use ipay and ihave as integers here
                    print(annualString)
                    print(hoursPerWeekString)
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let VC = storyBoard.instantiateViewController(withIdentifier: "SalaryDetailsVC") as! SalaryDetailsVC
                    VC.AnnualSalary = iannual
                    VC.HoursPerWeek = ihoursPerWeek
                    self.navigationController?.pushViewController(VC, animated: true)
                } else {
                    showToast(message: "Invalid input. Please enter valid numbers.", font: .systemFont(ofSize: 20))
                }
            }
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func MoreBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "MoreVC") as! MoreVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
