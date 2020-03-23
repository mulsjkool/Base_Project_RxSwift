//
//  MainNavigationController.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Common.setupNavigationBar(self.navigationBar)

        if let vc = viewControllers.first as? BaseViewController {
            vc.navigator = Navigator(navigationController: self)
        }
    }
}
