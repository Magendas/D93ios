//
//  MainTabBarController.swift
//  D93Conf
//
//  Created by Steve Song on 3/24/16.
//  Copyright © 2016 magendas. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.viewControllers![0].viewDidLoad()
    }
    
    override func viewDidLoad() {
        self.tabBar.tintColor = AppColors().Margenta
    }
}
