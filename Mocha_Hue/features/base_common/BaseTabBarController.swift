//
//  BaseTabViewController.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {

    private let borderWidth: CGFloat = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
			Colors.white.color()], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:
			Colors.redActiveTabbarItem.color()], for: .selected)

        UITabBar.appearance().tintColor = Colors.redActiveTabbarItem.color()

		if #available(iOS 10.0, *) {
			UITabBar.appearance().unselectedItemTintColor = Colors.unselectedTabbarItem.color()
		}

        UITabBar.appearance().backgroundImage = UIImage.imageWithColor(color: Colors.white.color())
        UITabBar.appearance().shadowImage = UIImage.imageWithColor(color: Colors.white.color())
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
