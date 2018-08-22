//
//  PesonalInfoViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class PersonalInfoViewModel {
    private var apiClient = APIClientManager()
    var personalModel : PersonalInfoModel?
    func getInfo ( api : String, parameters : [String : AnyObject], headers : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadPersonalInfoResponse(api: api, parameters: parameters, headers: headers){
            self.personalModel = self.apiClient.infoList
             complete()
        }
    }
}
