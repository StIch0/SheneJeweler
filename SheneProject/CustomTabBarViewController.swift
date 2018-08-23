//
//  File.swift
//  SheneProject
//
//  Created by pavelburdukovskii on 23/08/2018.
//  Copyright © 2018 pavelburdukovskii. All rights reserved.
//

import Foundation
import UIKit
class CustomTabBarViewController: UITabBarController , UITabBarControllerDelegate{
    let defauls = UserDefaults.standard
    let profileSegue : String = "profileSegue" 
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let title = item.title, title == "Профиль"{
            if defauls.string(forKey: "token") == nil{
                printDebug("NIL")
                performSegue(withIdentifier: profileSegue, sender: self)
            }else {
                printDebug(defauls.string(forKey: "token"))
            }

        }
        printDebug(item.title)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = false
    }
    
}
