//
//  NewsViewModel.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 16/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
class NewsViewModel : NSObject {
    private var apiClient = APIClientManager()
    var newsList = [NewsModel]()
    var detailViewModel : DetailViewModel!
    func getNews ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete){
        self.apiClient.downloadNews(api: api, parameters: parameters, headres: headres){
            self.newsList = self.apiClient.newslist
            complete()
        }
    }
    func numberOfItem()->Int{
        return newsList.count
    }
    func detailsViewModel (at index : Int)->DetailViewModel {
        self.detailViewModel = DetailViewModel(news: newsList[index])
        return self.detailViewModel
    }
}
