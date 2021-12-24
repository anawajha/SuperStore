//
//  HomeViewController.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/14/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import UIKit
import JGProgressHUD
import SDWebImage

class HomeViewController: UIViewController {

    private var products :[Product] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadProducts()
        // Do any additional setup after loading the view.
    }
    
    func loadProducts(){
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)

          Operations.getProducts { (response, error) in
              if error == nil {
                  guard let data = response else {return}
                  
                self.products.append(contentsOf: data)
                self.collectionView.reloadData()
                hud.dismiss(afterDelay: 0.5)
              }else {
                hud.textLabel.text = error?.localizedDescription
                hud.dismiss(afterDelay: 0.5)
            }
          }
      }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.productNameLable?.text = products[indexPath.item].title
        cell.image?.sd_setImage(with: URL(string: products[indexPath.item].image), placeholderImage: UIImage(named: "placeholder.png"))
        cell.productPriceLable.text = "\( products[indexPath.item].price)$"
        cell.productCategoryLable.text = products[indexPath.item].category
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2) - 39, height: 314)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let c = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        c.productId = products[indexPath.item].id
        navigationController?.pushViewController(c, animated: true)
    }
    
    
    
  
    
}
