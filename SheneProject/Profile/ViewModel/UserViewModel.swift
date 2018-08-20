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
    func getUser ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadUserResponse(api: api, parameters: parameters, headres: headres){
            self.userModel = self.apiClient.userList
            complete()
        }
    }
}
