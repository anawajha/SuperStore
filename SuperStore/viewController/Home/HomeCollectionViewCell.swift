//
//  HomeCollectionViewCell.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/15/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageContainer: UIView!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var productNameLable: UILabel!
    
    @IBOutlet weak var productCategoryLable: UILabel!
    
    @IBOutlet weak var productPriceLable: UILabel!
    
    
    override func awakeFromNib() {
        imageContainer.layer.borderColor = UIColor.gray.cgColor
        imageContainer.layer.borderWidth = 1
        
    }
    
    
    
    
    @IBAction func cart(_ sender: UIButton) {
    }
    
    @IBAction func favorite(_ sender: UIButton) {
    }
    
}
