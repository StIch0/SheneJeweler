//
//  ShopCell.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ShopCell : UITableViewCell {
    @IBOutlet weak var address : UILabel!
    @IBOutlet weak var workTime : UILabel!
    @IBOutlet weak var phone : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func loadData(from shopModel : ShopModel){
        address.text = shopModel.address
        workTime.text = shopModel.worktime
        phone.text = shopModel.phone
    }
}
