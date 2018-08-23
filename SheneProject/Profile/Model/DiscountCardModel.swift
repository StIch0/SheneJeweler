//
//  DiscountCardModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 23/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class DiscountCardModel : Mappable {
    var _id : String?
    var number : String?
    var sum : Double?
    var discount : Int?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        _id<-map["_id"]
        number<-map["number"]
        sum<-map["sum"]
        discount<-map["discount"]
    }
}
