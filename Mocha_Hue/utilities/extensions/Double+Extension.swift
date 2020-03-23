//
//  Double+Extension.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//
import Foundation

extension Double {

    func toDate() -> Date {
        return Date(timeIntervalSince1970: self / 1000)
    }

}
