//
//  Bool+Extension.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation

extension Bool {
    var intValue: Int {
        if self {
            return 1
        }
        return 0
    }
}
