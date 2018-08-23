//
//  ProfileViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 20/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class ProfileViewController : UIViewController {
    @IBOutlet weak var phoneTextField : UITextField!
    @IBOutlet weak var sendPhoneButton : UIButton!
    var viewModel = ProfileViewModel()
    var data : SuccessModel?
    var tokenModel : TokenModel?
    var validNumber = ""
    var checkDataAPI : String = ""
    
    let goToUserInfo : String = "goToUserInfo"
    let pin = "0000"
    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK : TO DO token and once show screen
//        self.printDebug("def = \(defaults.string(forKey: "token"))")
//        if let isToken = self.defaults.string(forKey: "token"), !isToken.isEmpty{
////            self.printDebug("isToken = \(isToken)")
////            let controller : UserViewController = UserViewController()
////            tabBarController?.setViewControllers([controller], animated: true)
//            performSegue(withIdentifier: profileSegue, sender: isToken)
//        }
//        phoneTextField = UITextField()
//        sendPhoneButton = UIButton()
//        data
        tabBarController?.hidesBottomBarWhenPushed = false
//        tabBarController
        hideKeyboardWhenTappedAround()
        phoneTextField.delegate = self
        phoneTextField.text = ""
        phoneTextField.placeholder = "+7"
        phoneTextField.addTarget(self, action: #selector(changeValueNumber), for: .editingDidEnd)
    }

    @IBAction func sendPhoneButtonAction(_ sender: Any) {
        viewModel.getSuccess(api: APISelected.enterPhone.rawValue, parameters: ["phone":Int(validNumber) as AnyObject], headres: [:],{
            self.data =  self.viewModel.successModel
            self.setAlertController(data: self.data!)
        },{
            error in
            self.showActionSheet(error)
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    func setAlertController(data : SuccessModel){
        if let success = data.success, success {
            let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
            //var textField = UITextField()
            alert.addTextField(configurationHandler: {
                field in
                field.placeholder = "Введите пин код"
            })
            let actionAlert = UIAlertAction(title: "Отправить", style: .default){
                alertA in
                 self.viewModel.getToken(api: APISelected.enterPin.rawValue, parameters: ["phone":Int(self.validNumber) as AnyObject, "pin": alert.textFields![0].text as AnyObject], headres: [:],{
                    self.tokenModel = self.viewModel.tokenModel
                    guard let token = self.tokenModel?.token else {return}
                    self.defaults.set(token, forKey: "token")
                    self.printDebug("TOKEN = \(self.defaults.string(forKey: "token"))")
                  self.dismiss(animated: true, completion: nil)
                    //self.performSegue(withIdentifier: self.goToUserInfo, sender: token)
                    
                 },{
                    error in
                        self.showActionSheet(error)
                 })
            }
            
            alert.addAction(actionAlert)
            present(alert, animated: true, completion: nil)
//
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! UserViewController
        let token = sender as! String
        controller.token = token
        navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = false
    }
    @objc func changeValueNumber(){
        guard let text = phoneTextField.text else { return}
        // validNumber = text.validPhoneNumber()
        validNumber = text
        print(validNumber)
        
    }
}
