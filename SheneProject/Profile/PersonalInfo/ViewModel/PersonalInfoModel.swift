//
//  PersonalInfoModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class PersonalInfoModel: Mappable {
    var     bonuscard : Array<AnyObject>?
    var  discountcard : Array<AnyObject>?
    var           _id : String?
    var         phone : Int?
    var           pin : String?
    var     createdAt : String?
    var     updatedAt : String?
    var           __v : Int?
    var      playerid : String?
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
        _id<-map["_id"]
        phone<-map["phone"]
        pin<-map["pin"]
        createdAt<-map["createdAt"]
        updatedAt<-map["updatedAt"]
        __v<-map["__v"]
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
