//
//  EmptyJsonTransformer.swift
//  ShiftMeApp
//
//  Created by Dao Le Quang on 6/29/16.
//  Copyright © 2016 Shift Me App. All rights reserved.
//

import Foundation

class EmptyJsonTransformer: JsonTransformer {
    func transform(json: Data) {
        return Void()
    }
}
