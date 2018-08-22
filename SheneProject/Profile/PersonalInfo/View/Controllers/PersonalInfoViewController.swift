//
//  PersonalInfoViewController.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 21/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class PersonalInfoViewController  : UIViewController{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var secondName : UITextField!
    @IBOutlet weak var lastName : UITextField!
    @IBOutlet weak var e_mail : UITextField!
    @IBOutlet weak var birthDay : UITextField!
    @IBOutlet weak var city : UITextField!
    @IBOutlet weak var street : UITextField!
    @IBOutlet weak var house : UITextField!
    @IBOutlet weak var flat : UITextField!
    var viewModel = PersonalInfoViewModel()
    var info : PersonalInfoModel?
    var token : String = ""
    var validBirthDate : Int64!
    var valideEmail : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        e_mail.addTarget(self, action: #selector(didEndEmailValidate), for: .editingDidEnd)
    }
    @IBAction func saveData(_ sender: UIButton) {
        printDebug("saveData")
        
        guard let name = name.text,
            let surname = secondName.text,
            let lastname = lastName.text,
            let city = city.text,
            let street = street.text,
            let house = house.text,
            let flat = flat.text else { return  }
        viewModel.getInfo(api: APISelected.updateinfo.rawValue, parameters: [
            "name": name as AnyObject,
            "surname" : surname as AnyObject,
            "lastname" : lastname as AnyObject,
            "email": valideEmail as AnyObject,
            "birthdate":Int(validBirthDate) as AnyObject,
            "city": city as AnyObject,
            "street": street as AnyObject,
            "house": house as AnyObject,
            "flat": flat as AnyObject], headers: ["auth": token]){

                self.info = self.viewModel.personalModel
                self.printDebug(self.info)
                self.showActionSheet("Изменения сохранены")
        }
    }

    @IBAction func didBeginTextFieldDate(_ sender: UITextField) {
        let datePiker = UIDatePicker()
        datePiker.datePickerMode = .date
        sender.inputView = datePiker
        datePiker.addTarget(self, action: #selector(valueChange), for: .valueChanged)
    }
    @objc func valueChange(sender:UIDatePicker){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        birthDay.text = dateFormater.string(from: sender.date)
        validBirthDate = sender.date.toMillis()
    }
    @objc func didEndEmailValidate (sender: UITextField){
        if let email = e_mail.text, email.isValidEmail(){
            valideEmail = email
        }
        else {
            showActionSheet("Проверьте введенный E-mail")
        }
    }
    
}