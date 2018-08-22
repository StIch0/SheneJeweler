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
    
    @IBOutlet weak var balanse: UILabel!
    @IBOutlet weak var discontcard: UILabel!
    @IBOutlet weak var bonuscard: UILabel!
    @IBOutlet weak var addDiscCard: UIButton!
    @IBOutlet weak var addBonusCard: UIButton!
    private let pesonalInfoSegue = "personalInfoSegue"
    private let chosenProductSegue = "chosenProductSegue"
    private let feedBackSegue = "feedBackSegue"
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK : get user info
        viewModel.getUser(api: APISelected.getUserInfo.rawValue, parameters: [:], headres: ["auth":token]){
            self.userModel = self.viewModel.userModel
            self.printDebug(self.userModel?.phone)
        }
    }
    @IBAction func chosenProduct(_ sender: UIButton) {
    }
    
    @IBAction func personalinfo(_ sender: UIButton) {
        performSegue(withIdentifier: pesonalInfoSegue, sender: token)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case pesonalInfoSegue?:
            let controller = segue.destination as! PersonalInfoViewController
            let token = sender as! String
            controller.token = token
        case feedBackSegue?:
            let controller = segue.destination as! FeedBackViewController
            let token = sender as! String
            controller.token = token
        case .none:
            break
        case .some(_):
            break
        }
        
    }
    @IBAction func feedBack(_ sender: UIButton) {
        performSegue(withIdentifier: feedBackSegue, sender: token)
    }
    
    
}
