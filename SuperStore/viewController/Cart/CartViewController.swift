//
//  CartViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/16/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit
import JGProgressHUD
import SDWebImage

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cartProducts:[Product] = []
    private var cartId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            loadProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }// viewWillAppear

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }//viewWillDisappear
    
    @IBAction func btnCheckout(_ sender: Any) {
    }
    
    private func loadProducts(){
        let hud = JGProgressHUD()
             hud.textLabel.text = "Loading"
             hud.show(in: self.view)

        Operations.getCart(userId: 1) { (response, error) in
            if error == nil {
                guard let res = response else {return}
                res.forEach { (cart) in
                    self.cartId = cart.id
                    cart.products.forEach { (product) in
                        Operations.getSingleProduct(id: product.productId) { (r, e) in
                            guard let resp = r else {return}
                            self.cartProducts.append(resp)
                            if self.tableView != nil {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
                hud.dismiss()

            }else {
                print(error!)
                hud.textLabel.text = error!.localizedDescription
                hud.dismiss(afterDelay: 2.0)
            }
        }
    }
    
}


extension CartViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.productImage.sd_setImage(with: URL(string: cartProducts[indexPath.item].image))
        cell.productTitle.text = cartProducts[indexPath.item].title
        cell.productPrice.text = "\(cartProducts[indexPath.item].price)"
        cell.productCategory.text = cartProducts[indexPath.item].category
        cell.cartId = self.cartId
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128.0
    }
    
    
}
