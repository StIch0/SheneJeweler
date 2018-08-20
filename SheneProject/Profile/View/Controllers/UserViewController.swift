//
//  UserViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class UserViewController : UIViewController {
    var userModel : UserModel?
    var viewModel : UserViewModel = UserViewModel()
    var token : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getUser(api: APISelected.getUserInfo.rawValue, parameters: [:], headres: ["auth":token]){
            self.userModel = self.viewModel.userModel
            printDebug(self.userModel?.phone)
        }
//        print("phone = \(self.userModel?.phone)")
    }
}
