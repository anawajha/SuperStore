//
//  Cart.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/17/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import Foundation

struct Cart :Codable{
    var id:Int
    var userId:Int
    var date:String
    var products:[CartProducts]
    var __v:Int?
}

struct CartProducts :Codable{
    var productId:Int
    var quantity:Int
}

struct DeleteCart:Codable{
    var id:Int?
    var userId:Int?
    var date:String?
    var products:[CartProducts]
}

  /*
   
   {"id":1,"userId":1,"date":"2020-03-02T00:00:02.000Z","products":[{"productId":1,"quantity":4},{"productId":2,"quantity":1},{"productId":3,"quantity":6}],"__v":0}
   
   */
