//
//  Constants.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//

import Foundation
import UIKit

let defaultNotification = NotificationCenter.default

struct Constants {
    struct Singleton {
        // swiftlint:disable:next force_cast
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
        static let isiPad = UIDevice.current.model.hasPrefix("iPad")
        static var isLandscape: Bool { return UIDevice.current.orientation.isLandscape }
    }
    
    struct DeviceMetric {
        static let screenSize = UIScreen.main.bounds.size
        static let screenWidth = DeviceMetric.screenSize.width
        static let screenHeight = DeviceMetric.screenSize.height
        static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        static let navBarHeight = UINavigationController().navigationBar.frame.size.height
        static let navBarButtonWidthMBC = CGFloat(24)
        static let navBarButtonWidthBell = CGFloat(20)
        static let navBarSearchBarMargin = CGFloat(8)
        static let navBarSearchBarHeight = CGFloat(24)
        static let tabbarHeight = UITabBarController().tabBar.frame.size.height
        static let displayViewHeightWithNavAndTabbar = DeviceMetric.screenHeight -
            DeviceMetric.statusBarHeight - DeviceMetric.navBarHeight - DeviceMetric.tabbarHeight
        
        static let searchDefaultFrame = CGRect(x: 0, y: 0,
                                               width: Constants.DeviceMetric.screenWidth
                                                - Constants.DeviceMetric.navBarButtonWidthMBC
                                                - Constants.DeviceMetric.navBarButtonWidthBell,
                                               height: Constants.DeviceMetric.navBarSearchBarHeight)
        static let searchExpandedFrame = CGRect(x: 0, y: 0,
                                                width: Constants.DeviceMetric.screenWidth,
                                                height: Constants.DeviceMetric.navBarSearchBarHeight)
    }
    
    struct DefaultValue {
        /// Strings
        static let SiteName = "MBC.net"
        static let DefaultAlbumName = "default-albums"
        static let MetadataSeparatorString = " • "
        static let separatorCharacter = "•"
        static let InforTabMetadataSeparatorString = "/"
        static let InforTabMetadataGenreSeparatorString = ","
        static let MetadataOccupationSeparatorString = " - "
        static let MetadataLinkedValueSeparatorString = "-"
        static let InterestSeparatorString = " ، "
        static let DotSeparatorString = " . "
        static let TimeSeparator = ":"
    }
    
    struct ConfigurationSharingExtension {
        static let googlePlus = "com.google.GooglePlus.ShareExtension"
        static let whatsApp = "net.whatsapp.WhatsApp.ShareExtension"
    }
}
