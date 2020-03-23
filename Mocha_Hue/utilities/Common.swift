//
//  Common.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import UIKit
import AVFoundation

func delay(_ delay: Double, closure:@escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: closure)
}

class Common {
    
    // MARK: Public functions
    static func setupNavigationBar(_ navigationBar: UINavigationBar?) {
        UINavigationBar.appearance().tintColor = Colors.white.color()
        UINavigationBar.appearance().barTintColor = Colors.dark.color()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "ic_arrow_back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "ic_arrow_back")
        navigationBar?.barStyle = .black
    }
    
    static func setStatusBarColor(_ color: UIColor) {
        if let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = color
        }
    }
}
