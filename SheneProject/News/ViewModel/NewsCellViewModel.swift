//
//  NewsCellViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class NewsCellViewModel {
    var img : String?
    var caption : String?
    required init(newsModel : NewsModel) {
        img = newsModel.img
        caption = newsModel.caption
    }
}
