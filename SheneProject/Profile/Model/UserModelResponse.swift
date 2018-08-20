//
//  UserModelResponse.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class UserModelResponse : Mappable {
    var user : UserModel?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        user<-map["user"]
    }
}
