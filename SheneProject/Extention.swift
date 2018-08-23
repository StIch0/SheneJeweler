//
//  Extention.swift
//  Shene
//
//  Created by pavelburdukovskii on 14/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showActionSheet(_ message : String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .actionSheet)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            alert.dismiss(animated: true, completion: nil)
        })
        
    }
    func printDebug(_ message : Any...) -> Void {
        for mes in message {
            print("************************* \n \(mes) \n ************************* \n")
        }
    }
}

extension UIColor
{
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alph: CGFloat = 1) -> UIColor
    {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alph)
    }
}

extension UIViewController {
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension String {
    func validPhoneNumber()->String{
        return String(self.dropFirst(2))
    }
}
extension String {
    func isValidEmail() -> Bool {
        // here, try! will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    var rubles : String {
        return self + "р."
    }
    var percent : String {
        return self + "%"
    }
}
extension Date {
    
    func toMillis() -> Int! {
        return Int(self.timeIntervalSince1970 * 1000)
    }
    
    init(millis: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(millis / 1000))
        self.addTimeInterval(TimeInterval(Double(millis % 1000) / 1000 ))
    }
    
}
