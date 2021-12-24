//
//  SettingsViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/17/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var btnUpdateSettings: UIButton!
    @IBOutlet weak var nofificationSwitch: UISwitch!
    @IBOutlet weak var popupsswitch: UISwitch!
    @IBOutlet weak var orederHistorySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
    btnUpdateSettings.layer.cornerRadius = 24.0
        setUpShadow(nofificationSwitch)
        setUpShadow(popupsswitch)
        setUpShadow(orederHistorySwitch)
       
    }
    
    func setUpShadow(_ s:UISwitch){
               s.layer.shadowColor = UIColor.gray.cgColor
               s.layer.shadowRadius = 5.0
               s.layer.shadowOpacity = 0.5
    }
    

}
