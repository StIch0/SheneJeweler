//
//  ShopViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class ShopViewModel {
    private var apiClient = APIClientManager()
    var shopList = [ShopModel]()
    func getShops ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadShop(api: api, parameters: parameters, headres: headres){
//
            self.shopList = self.apiClient.shopList
//              printDebug("count = \(self.shopList.count)")
            complete()
        }
    }
    func numberOfItem()->Int{
        return shopList.count
    }
}
