//
//  ShopModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 16/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class ShopModel : Mappable {
    var address : String?
    var worktime : String?
    var phone : String?
    var lat : Double?
    var lng : Double?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        address<-map["address"]
        worktime<-map["worktime"]
        phone<-map["phone"]
        lat<-map["lat"]
        lng<-map["lng"]
    }
}
