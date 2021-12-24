//
//  Product.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/15/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import Foundation

struct Product:Codable{
    var id:Int
    var title:String
    var price:Float
    var description:String
    var category:String
    var image:String
    var rating:Rate
}


struct Rate:Codable{
    var rate:Float
    var count:Int
}
