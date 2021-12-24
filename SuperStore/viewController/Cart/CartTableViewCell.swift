//
//  CartTableViewCell.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/16/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view:UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var cartId:Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 0.8
    }
    
    @IBAction func deleteCart(_ sender: Any) {
//        let sb = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = sb.instantiateViewController(identifier: "CartViewController") as! CartViewController
        
        Operations.deleteCart(id: cartId) { response , error in
            if error == nil {
                guard let res = response else {return}
                print("Cart deleted successfully : \(res)")

                Constants.Helpers.showAlert(controller:CartViewController(), title: "Cart deleted", message: "")
            }else{
                print(error!.localizedDescription)
                Constants.Helpers.showAlert(controller: CartViewController() , title: "Cart delete failed", message: "\(error!.localizedDescription)")
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
