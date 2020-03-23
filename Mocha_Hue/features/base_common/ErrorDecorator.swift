//
//  ErrorDecorator.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorDecorator: class {
    func showError(message: String, completed: (() -> Void)?)
    func showConfirm(message: String, leftAction: AlertAction, rightAction: AlertAction)
}
