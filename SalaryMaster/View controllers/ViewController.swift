//
//  ViewController.swift
//  SalaryMaster
//
//  Created by Mac on 15/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NextBtn: UIButton!
    
    @IBOutlet weak var settingBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NextBtn.layer.cornerRadius = NextBtn.frame.size.height / 2
        settingBtn.layer.cornerRadius = settingBtn.frame.size.height / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "SalaryVC") as! SalaryVC
        self.navigationController?.pushViewController(VC, animated: true)
    }

    @IBAction func settingBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

