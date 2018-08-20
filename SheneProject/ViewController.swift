//
//  ViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 13/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView : UITableView!
    var viewModel = NewsViewModel()
    var data = [NewsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        view = tableView
        loadData()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    func loadData(){
        viewModel.getNews(api: APISelected.news.rawValue, parameters: [:], headres: [:]){
            self.data = self.viewModel.newsList
            self.tableView.reloadData()
        }
//        viewModel.getNews {
//            self.data = self.viewModel.newsList
//            self.tableView.reloadData()
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].caption
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
}

