//
//  Fonts.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {
    enum Primary: String {
        case regular = "29LTKaff-Regular"
        case ultraLight = "29LTKaff-UltraLight"
        case black = "29LTKaff-Black"
        case semiBold = "29LTKaff-SemiBold"

        func toFontWith(size: Double) -> UIFont? {
            return UIFont(name: self.rawValue, size: CGFloat(size))
        }

        var fontName: String {
            return rawValue
        }
    }
}
