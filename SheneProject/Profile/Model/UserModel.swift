//
//  UserModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class UserModel : Mappable {
    var     bonuscard : [AnyObject]?
    var     discountcard : [AnyObject]?
    var     phone : Int?
    var     playerid : AnyObject?
    var     birthdate : Int?
    var          city : String?
    var         email : String?
    var          flat : String?
    var         house : String?
    var      lastname : String?
    var          name : String?
    var        street : String?
    var       surname : String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bonuscard<-map["bonuscard"]
        discountcard<-map["discountcard"]
        phone<-map["phone"]
        playerid<-map["playerid"]
        birthdate<-map["birthdate"]
        city<-map["city"]
        email<-map["email"]
        flat<-map["flat"]
        house<-map["house"]
        lastname<-map["lastname"]
        name<-map["name"]
        street<-map["street"]
        surname<-map["surname"]
    }
    
    
}
