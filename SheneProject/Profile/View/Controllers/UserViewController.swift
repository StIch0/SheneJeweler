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

    var token : String = ""
    
    var userModel : UserModel?
    var userViewModel : UserViewModel = UserViewModel()
    var defaults = UserDefaults.standard
    @IBOutlet weak var expirationDate: UILabel!
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
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        tabBarController?.hidesBottomBarWhenPushed = false
       
//        if let tokenDef = defaults.string(forKey: "token"){
//            token = tokenDef
//            token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjViNmQzM2IxMmE5OWE4NTQzMjNiNDlmOSIsInBob25lIjoiOTY3NjIxMzAyMyIsImlhdCI6MTUzNDkzMDI0M30.dD02WRiEKAAW0Tl-dSQgy5XoOiS3qDTsmptEnHJmChg"
//        }
//        loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        printDebug("TOKEN @ + = \(defaults.string(forKey: "token"))")
        if let unwrapToken = defaults.string(forKey: "token"){
            token = unwrapToken
            loadData(token: token)
        }
        
    }
    @IBAction func personalinfo(_ sender: UIButton) {
        performSegue(withIdentifier: pesonalInfoSegue, sender: userModel)
    }
    private func loadData(token : String){
        //MARK : get user info
        printDebug(token)
        userViewModel.getUser(api: APISelected.getUserInfo.rawValue, parameters: [:], headres: ["auth":token], {
            self.userModel = self.userViewModel.userModel
            if let model = self.userModel{
                self.setData(from: model)
            }
            self.printDebug(self.userModel?.phone)
        }, {
            error in
            self.showActionSheet(error)
        })
    }
    private func setData(from model : UserModel){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
//        balanse.text += model
        guard let dCard = model.discountcard?.first, let bCard = model.bonuscard?.first else{return}
        discontcard.text = "№ \(dCard.number ?? "") (\(dCard.discount ?? 0)%)   \(dCard.sum ?? 0.0)".rubles
        bonuscard.text = "№ \(bCard.number ?? "")     \(bCard.sum ?? 0.0)".rubles
        let expDate = Date(millis: bCard.expirationDate ?? 0)
        expirationDate.text = "действительна до \(dateFormater.string(from: expDate))"
//        view.reloadInputViews()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case pesonalInfoSegue?:
            let controller = segue.destination as! PersonalInfoViewController
//            let token = sender as! String
//            controller.token = token
            controller.userModel = sender as? UserModel
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
    func addCard(for type : String, number : String){
        printDebug("\(type) \(number) \(token)")
        userViewModel.addCard(api: APISelected.addCard.rawValue, parameters: ["number":number as AnyObject, "type":type as AnyObject], headres: ["token":token], {
//            self.printDebug("A")
            self.userModel = self.userViewModel.userModel
//            self.printDebug("\(self.userModel)")
            if let model = self.userModel{
//                self.printDebug("QQQQQ \(model.phone)")
                self.setData(from: model)
            }
        }, {
            error in
            self.showActionSheet(error)
        })
    }
    @IBAction func addBonusCard(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
            field in
            field.placeholder = "Введите номер карты"
        })
        let actionAlert = UIAlertAction(title: "Отправить", style: .default){
            alertA in
            alert.textFields![0].delegate = self
            
            guard let number = alert.textFields![0].text else {return}
            self.printDebug("alert.textFields![0] \(number)")
                self.addCard(for: TypeCard.bonus.rawValue , number: number)
        }
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addDiscountCard(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {
            field in
            field.placeholder = "Введите номер карты"
        })
        let actionAlert = UIAlertAction(title: "Отправить", style: .default){
            alertA in
            alert.textFields![0].delegate = self
            guard let number = alert.textFields![0].text else {return}
            self.addCard(for: TypeCard.discount.rawValue , number: number)
        }
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
    
}
