//
//  AccountViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/16/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    let setings :[[String:Any]] = [
        ["image":UIImage(named: "ic_edit")!,"title":"Edit Profile","isNew":false],
        ["image":UIImage(named: "ic_location")!,"title":"Shipping Address","isNew":false],
        ["image":UIImage(named: "ic_wishlist")!,"title":"Whishlist","isNew":true],
        ["image":UIImage(named: "ic_history")!,"title":"Order History","isNew":false],
        ["image":UIImage(named: "ic_track_order")!,"title":"Track Order","isNew":false],
        ["image":UIImage(named: "ic_cards")!,"title":"Cards","isNew":false],
        ["image":UIImage(named: "ic_notificaton")!,"title":"Notifications","isNew":false],
        ["image":UIImage(named: "ic_logout")!,"title":"Logout","isNew":false]]
        
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            getCurrentUser()
    }
    
    private func getCurrentUser(){
        Operations.getUserData(userId:1 ,handler:{ response, error in
            if error == nil {
                guard let res = response else {return}
                self.userName.text = "\(res.name.firstname) \(res.name.lastname)"
                self.userEmail.text = res.email
                self.reloadInputViews()
            }else{
                print(error!)
                Constants.Helpers.showAlert(controller: self, title: "Error", message: error?.localizedDescription)
            }
        })
    }
    
    
}


extension AccountViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.setings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountSettingsCell", for: indexPath) as! AccountTableViewCell
        let row = setings[indexPath.item]
        cell.icon.image = row["image"] as! UIImage
        cell.lable.text = (row["title"] as! String)
        if (row["isNew"] as! Bool) {
            cell.isNew.isHidden = false
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
    
}
