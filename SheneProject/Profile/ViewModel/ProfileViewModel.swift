//
//  SuccessViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class ProfileViewModel{
    private var apiClient = APIClientManager()
    var successModel : SuccessModel?
    var tokenModel : TokenModel?
    func getSuccess ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadPhoneNumber(api: api, parameters: parameters, headres: headres){
            self.successModel = self.apiClient.successList
            complete()
        }
    }
    
    func getToken ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadToken(api: api, parameters: parameters, headres: headres){
            self.tokenModel = self.apiClient.tokenList
            complete()
        }
    }
}
