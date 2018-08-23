//
//  NewsViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class NewsViewController : UIViewController {
    var tableView : UITableView!
    var viewModel = NewsViewModel()
    var data = [NewsModel]()
    let cellId = "newsCell"
    let segue = "detailSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: cellId)
        view = tableView
        
        loadData()
    }
    func loadData(){
        viewModel.getNews(api: APISelected.news.rawValue, parameters: [:], headres: [:], {
            self.data = self.viewModel.newsList
            self.tableView.reloadData()
        }, {
            error in
            self.showActionSheet(error)
        })
    }
}

