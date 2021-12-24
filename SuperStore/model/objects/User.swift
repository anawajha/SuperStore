//
//  User.swift
//  SuperStore
//
//  Created by Asad F. El Nawajha on 12/17/21.
//  Copyright © 2021 Asad F Nawajha. All rights reserved.
//

import Foundation

struct User :Codable{
    var id:Int
    var email:String
    var username:String
    var password:String
    var name:Name
    var address:Address
    var phone:String
    
}

struct Name :Codable{
    var firstname:String
    var lastname:String
}

struct Address :Codable{
    var geolocation:Geolocation
    var city:String
    var street:String
    var number:Int
    var zipcode:String
}

struct Geolocation :Codable{
    var lat:String
    var long:String
}
