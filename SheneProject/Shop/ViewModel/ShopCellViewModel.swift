//
//  ShopCellViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class ShopCellViewModel {
    var address : String?
    var workTime : String?
    var phone : String?
    required init(shopModel : ShopModel) {
        address = shopModel.address
        workTime = shopModel.worktime
        phone = shopModel.phone
    }
}
