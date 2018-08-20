//
//  Extention.swift
//  Shene
//
//  Created by pavelburdukovskii on 14/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
func printDebug(_ message : Any) -> Void {
    print("************************* \n \(message) \n *************************")
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
