//
//  constants.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/15/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import Foundation
import UIKit

class Constants{
    
    struct API {
        static let baseURL = "https://fakestoreapi.com"
        static let products = "/products"
        static let categories = "/categories"
        static let cart = "/carts/user/"
        static let login = "/auth/login"
        static let newCart = "/carts"
        static let user = "/users/"
        static let deleteCart = "https://fakestoreapi.com/carts/"
        
    }
    
    struct Helpers {
        static func showAlert(controller:UIViewController, title:String,message:String?){

                    let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)

                    let okAction = UIAlertAction(title:"OK", style: .default, handler: { action in
                    })

                    alert.addAction(okAction)
//
//                    alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
//
//                    alert.addAction(UIAlertAction(title:"DELETE", style: .destructive, handler: { (action) in
//                    }))
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    enum Status:String {
        case success = "success"
        case failre = "failre"
    }
}
