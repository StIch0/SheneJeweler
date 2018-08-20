//
//  APIClientManager.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 16/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
typealias DownloadComplete = ()->()
let API_BASE_URL = "http://s8.ibb.su:3008"
class APIClientManager: NSObject {
    var newslist : Array = {
        return [NewsModel]()
    }()
    var shopList : Array = {
        return [ShopModel]()
    }()
    var successList : SuccessModel?
    var tokenList : TokenModel?
    var userList : UserModel?
    func downloadNews( api : String, parameters : [String : AnyObject], headres : [String : String], _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
        Alamofire.request(url, method : .post, parameters : parameters ,headers : headres).responseObject{
            (respone : DataResponse<NewsModelResponse>) in
            let list = respone.result.value
            if let newsModel = list?.news{
                for (_,new) in newsModel.enumerated(){
                    self.newslist.append(new)
                }
            }
            complete()
        }
    }
    func downloadShop(api : String, parameters : [String : AnyObject], headres : [String : String] , _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
         Alamofire.request(url, method : .post, parameters : parameters ,headers : headres).responseObject{
            (respone : DataResponse<ShopModelResponse>) in
            let list = respone.result.value
            if let shopModel = list?.shop{
                 for (_,new) in shopModel.enumerated(){
                    self.shopList.append(new)
                }
            }
            complete()
        }
    }
    func downloadPhoneNumber(api : String, parameters : [String : AnyObject], headres : [String : String] , _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
        Alamofire.request(url, method : .post, parameters : parameters ,headers : headres).responseObject{
            (respone : DataResponse<SuccessModel>) in
            let list = respone.result.value
            if let successModel = list{
                self.successList = (successModel)
            }
            complete()
        }
    }
    func downloadToken(api : String, parameters : [String : AnyObject], headres : [String : String] , _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
        Alamofire.request(url, method : .post, parameters : parameters ,headers : headres).responseObject{
            (respone : DataResponse<TokenModel>) in
            let list = respone.result.value
            if let tokenModel = list{
                self.tokenList = (tokenModel)
            }
            complete()
        }
    }
    func downloadUserResponse(api : String, parameters : [String : AnyObject], headres : [String : String] , _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
        Alamofire.request(url, method : .post, parameters : parameters ,headers : headres).responseObject{
            (respone : DataResponse<UserModelResponse>) in
            let list = respone.result.value
            if let userModel = list?.user{
                self.userList = (userModel)
            }
            complete()
        }
    }
}
