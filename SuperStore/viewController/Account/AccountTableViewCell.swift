//
//  AccountTableViewCell.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/16/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var isNew: UIView!
    @IBOutlet weak var seeAll: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
