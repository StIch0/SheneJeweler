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
            if let token = defauls.string(forKey: "token"){
                    if token.isEmpty{
                        printDebug("token = \(token)")
                        performSegue(withIdentifier: profileSegue, sender: self)
                }

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
