//
//  SugestionsTableViewCell.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/16/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class SugestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 19.0
        view.layer.borderWidth = 0.8
        view.layer.borderColor = UIColor.gray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
