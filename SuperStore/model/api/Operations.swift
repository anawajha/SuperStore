//
//  Operations.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/15/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import Foundation
import Alamofire

class Operations{
    

    static func getUserData(userId:Int, handler:@escaping (User?,Error?)-> Void){
        AF.request(Constants.API.baseURL + Constants.API.user + "\(userId)").responseJSON { response in
        if let data = response.data {
            do{
                let res = try JSONDecoder().decode(User.self, from: data)
                handler(res,nil)
            }catch {
                handler(nil,error)
                print(error)
            }
        }
    }
    }
    
    
    static func getProducts(handler:@escaping ([Product]?,Error?)-> Void){
        AF.request(Constants.API.baseURL + Constants.API.products).responseJSON { response in
            if let data = response.data {
                do{
                    let res = try JSONDecoder().decode([Product].self, from: data)
                    handler(res,nil)
                }catch {
                    handler(nil,error)
                    print(error)
                }
            }
        }
    }// getProducts
    
    
    static func login(userLogin:Login,handler:@escaping (Token?,Error?)->Void){
        AF.request(Constants.API.baseURL + Constants.API.login,method:  .post,parameters: userLogin,encoder: JSONParameterEncoder.default).responseJSON { response in
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode(Token.self, from: data)
                    handler(res,nil)
                }catch{
                    handler(nil,error)
                    print(error)
                }
            }
        }
    }// login
    
    
    
    
    
    static func getSingleProduct(id:Int,handler:@escaping (Product?,Error?)-> Void){
        AF.request(Constants.API.baseURL + Constants.API.products + "/\(id)").responseJSON { response in
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode(Product.self, from:data)
                          handler(res,nil)
                      }catch{
                          handler(nil,error)
                          print(error)
                      }
            }
        }
    }// getSingleProduct
    
    
    static func getCart(userId:Int,handler:@escaping ([Cart]?,Error?)->Void){
        var cart:[Cart] = []
        AF.request(Constants.API.baseURL + Constants.API.cart + "\(userId)").responseJSON { response in
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode([Cart].self, from: data)
                    cart.append(contentsOf: res)
                    handler(res,nil)
                }catch{
                   handler(nil,error)
                    print(error)
                }
            }
        }
    }// getCart
    
    
    static func addCart(cart:Cart,hanler:@escaping (Cart?,Error?)->Void){
        AF.request(Constants.API.baseURL + Constants.API.newCart,method: .post,parameters: cart,encoder: JSONParameterEncoder.default).responseJSON { response in
            if let data = response.data{
                do{
                    let res = try JSONDecoder().decode(Cart.self, from: data)
                    hanler(res,nil)
                }catch{
                    hanler(nil,error)
                    print(error)
                }
            }
        }
    }// addCart
    
    
    static func deleteCart(id:Int,handler:@escaping (DeleteCart?,Error?)->Void){
        AF.request("\(Constants.API.deleteCart)\(id)",method: .delete).responseJSON { response in
            if let data = response.data {
                do{
                    let res  = try JSONDecoder().decode(DeleteCart.self, from: data)
                    handler(res,nil)
                }catch {
                    handler(nil,error)
                    print(error)
                }
            }
        }
    }// deleteCart
  
    
}
