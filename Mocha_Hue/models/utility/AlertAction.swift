//
//  AlertAction.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation

struct AlertAction {
    var title: String
    var handler: (() -> Void)

    init(title: String, handler: @escaping (() -> Void)) {
        self.title = title
        self.handler = handler
    }
}
