//
//  DetailViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class DetailViewModel {
    var caption : String?
    var img : String?
    var content : String?
    init(news : NewsModel) {
        caption = news.caption
        img = news.img
        content = news.content
    }
}
