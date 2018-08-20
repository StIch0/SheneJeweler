//
//  NewsModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 13/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsModel: Mappable {
    var _id : String?
    var caption : String?
    var img : String?
    var content : String?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        _id<-map["_id"]
        caption<-map["caption"]
        img<-map["img"]
        content<-map["content"]
    }
}
