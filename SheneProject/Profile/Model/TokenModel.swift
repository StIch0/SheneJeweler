//
//  TokenModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class TokenModel : Mappable {
    var token : String?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        token<-map["token"]
    }
}
