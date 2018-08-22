//
//  FeedBackViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 22/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation

class FeedBackViewModel {
    private var apiClient = APIClientManager()
    var successModel : SuccessModel?
    func getSuccess ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadFeedBack(api: api, parameters: parameters, headres: headres){
            self.successModel = self.apiClient.successList
            complete()
        }
    }
}
