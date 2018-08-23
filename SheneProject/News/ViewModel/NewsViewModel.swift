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
    var newsCellViewModelList = [NewsCellViewModel]()
    var detailViewModel : DetailViewModel!
    func getNews ( api : String, parameters : [String : AnyObject], headres : [String : String],_ complete : @escaping DownloadComplete, _ unComplete : @escaping DownloadError){
        self.apiClient.downloadNews(api: api, parameters: parameters, headers: headres, {
            self.newsList = self.apiClient.newslist
            for obj in self.newsList{
                self.newsCellViewModelList.append(NewsCellViewModel(newsModel: obj))
            }
            complete()
        }, {
            error in
            unComplete(error)
        })
    }
    func numberOfItem()->Int{
        return newsList.count
    }
    func detailsViewModel (at index : Int)->DetailViewModel {
        self.detailViewModel = DetailViewModel(news: newsList[index])
        return self.detailViewModel
    }
    func cellViewModel(at index : Int)->NewsCellViewModel?{
        guard index < newsCellViewModelList.count else {
            return nil
        }
        return newsCellViewModelList[index]
    }
}
