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
typealias DownloadError = (String)->()
let API_BASE_URL = "http://s8.ibb.su:3008"
class APIClientManager: NSObject {
    //MARK : models
    var newslist : Array = {
        return [NewsModel]()
    }()
    var shopList : Array = {
        return [ShopModel]()
    }()
    var successList : SuccessModel?
    var tokenList : TokenModel?
    var userList : UserModel?
    var infoList : PersonalInfoModel?
    
    //MARK : load news ______________________________________________________________________________
    func downloadNews( api : String, parameters : [String : AnyObject], headers : [String : String], _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
        Alamofire.request(url, method : .post, parameters : parameters ,headers : headers).responseObject{
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
    //MARK : load shop ______________________________________________________________________________
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
    //MARK : load phone number and get gin ______________________________________________________________________________
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
    //MARK : load token ______________________________________________________________________________
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
    //MARK : load user info ______________________________________________________________________________
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
    //MARK : load personal info, more value, than user info ______________________________________________________________________________
    func downloadPersonalInfoResponse(api : String, parameters : [String : AnyObject], headers : [String : String] , _ complete : @escaping DownloadComplete){
        let url = "\(API_BASE_URL)/v1/\(api)"
         Alamofire.request(url, method : .post, parameters : parameters ,headers : headers).responseObject{
            (respone : DataResponse<PersonalInfoModelResponse>) in
             switch respone.result {
            case .success(let value):
                 if let infoModel = value.info{
                     self.infoList = (infoModel)
                 }
                complete()
            case .failure(let error):
                print("error = \(error.localizedDescription)")
                
            }

        }
    }
    //MARK : send feed back message ______________________________________________________________________________
    func downloadFeedBack(api : String, parameters : [String : AnyObject], headres : [String : String] , _ complete : @escaping DownloadComplete){
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
}
