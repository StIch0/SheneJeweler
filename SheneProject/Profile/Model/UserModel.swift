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
    var bonuscard : [AnyObject]?
    var discountcard : [AnyObject]?
    var phone : Int?
    var playerid : AnyObject?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bonuscard<-map["bonuscard"]
        discountcard<-map["discountcard"]
        phone<-map["phone"]
        playerid<-map["playerid"]
    }
    
    
}
