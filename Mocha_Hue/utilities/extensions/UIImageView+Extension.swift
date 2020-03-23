//
//  UIImageView+Extension.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Kingfisher
import SnapKit
import UIKit

extension UIImageView {
    
    class func setMaxDiskCacheSize(_ value: UInt) {
        ImageCache.default.maxDiskCacheSize = value
    }
    
    func cancelDownloadTask() {
        self.kf.cancelDownloadTask()
    }
    
}
