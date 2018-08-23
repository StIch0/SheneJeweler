//
//  UserViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class UserViewModel {
    var apiClient = APIClientManager()
    var userModel : UserModel?
    func getUser ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete, _ unComplete : @escaping DownloadError){
        self.apiClient.downloadUserResponse(api: api, parameters: parameters, headres: headres,{
            self.userModel = self.apiClient.userList
            complete()
        },{
            error in
            unComplete(error)
        })
    }
    func addCard ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete, _ unComplete : @escaping DownloadError){
        self.apiClient.downloadCard(api: api, parameters: parameters, headres: headres, {
            self.userModel = self.apiClient.userList
            complete()
        },{
            error in
            unComplete(error)
        })
    }
}
