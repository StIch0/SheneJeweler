//
//  NewsCell.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class NewsCell : UITableViewCell {
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var caption : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func loadData(from newsModel : NewsModel){
        guard let url = newsModel.img else { return  }
        img.sd_setImage(with: URL(string: "\(API_BASE_URL)/\(url)"))
        caption.text = newsModel.caption
    }
}
