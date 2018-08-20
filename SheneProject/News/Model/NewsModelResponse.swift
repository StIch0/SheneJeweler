//
//  NewsModelGen.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 16/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import ObjectMapper
class NewsModelResponse: Mappable {
    var news = [NewsModel]()
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        news<-map["news"]
    }
}
