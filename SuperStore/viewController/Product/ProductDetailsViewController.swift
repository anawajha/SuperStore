//
//  ProductDetailsViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/15/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit
import JGProgressHUD

class ProductDetailsViewController: UIViewController {

    var productId:Int? = nil
    private var product:Product? = nil
    private var quantity:Int = 1
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var productDescreption: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var quantityLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddtoCart.layer.cornerRadius = 24.0
        quantityLable.text = "\(quantity)"
        loadProduct()
    }
    
    @IBAction func plus(_ sender: Any) {
        if quantity < 10{
            quantity += 1
            quantityLable.text = "\(quantity)"
        }
      }
    
      @IBAction func minus(_ sender: Any) {
        if quantity > 1 {
            quantity -= 1
            quantityLable.text = "\(quantity)"
        }
      }
    
    
    @IBAction func addToCart(_ sender: Any) {
        if let p = product {
            let hud = JGProgressHUD()
            hud.textLabel.text = "Adding to Cart..."
            hud.show(in: self.view, animated: true)
            
        var products:[CartProducts] = []
        products.append(CartProducts.init(productId: p.id, quantity: quantity))
            let cart = Cart.init(id: 0, userId: 2, date: "\(Date())", products: products, __v: 0)
            Operations.addCart(cart: cart) { (respnse, error) in
                if error == nil {
                    guard let res = respnse else {return}
                    print("Added to Cart : \(res)")
                    hud.dismiss()
                    Constants.Helpers.showAlert(controller: self, title: "Added to cart", message: "\(self.quantity) has been added to cart")
                }else {
                    Constants.Helpers.showAlert(controller: self, title: "Adding Failed", message: "\(error!.localizedDescription)")
                    hud.dismiss(afterDelay: 2.0)
                    print(error!)
                }
            }
        }else {
            print("nil product")
            Constants.Helpers.showAlert(controller: self, title: "Error", message: "Product not found")
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
self.navigationController?.navigationBar.tintColor = UIColor.white
      let backButton = UIBarButtonItem()
      backButton.title = nil
      self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }// viewWillAppear

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkText]
    }//viewWillDisappear
  
    
    func loadProduct(){
        guard let id = productId else {return}
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading..."
        
        Operations.getSingleProduct(id: id) { (response, error) in
            if error == nil{
                guard let res = response else {return}
                self.product = res
                
                self.productImage?.sd_setImage(with: URL(string: res.image))
                self.productTitle.text = res.title
                self.productPrice.text = "\(res.price)$"
                self.productDescreption.text = res.description
                self.title = res.title
                hud.dismiss(afterDelay: 0.5)
            }else {
                hud.textLabel.text = "Error"
                hud.dismiss(afterDelay: 2.0)
            }
        }
    }
    
}

extension ProductDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sugestionsCell", for: indexPath)
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    
    
}
