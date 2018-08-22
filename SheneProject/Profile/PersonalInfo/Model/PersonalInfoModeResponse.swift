//
//  PersonalInfoModeResponse.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class PersonalInfoModelResponse: Mappable {
    var info : PersonalInfoModel?
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        info<-map["info"]
    }
}
