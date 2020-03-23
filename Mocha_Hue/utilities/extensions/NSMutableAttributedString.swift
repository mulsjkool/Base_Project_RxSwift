//
//  NSMutableAttributedString.swift
//  Mocha_Hue
//
//  Created by ChinhPV on 3/23/20.
//  Copyright © 2020 ChinhPV. All rights reserved.
//
import UIKit

extension NSMutableAttributedString {
	func colorForText(_ textToFind: String, with color: UIColor) {
		let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
		if range.location != NSNotFound { addAttribute(.foregroundColor, value: color, range: range) }
	}
}
