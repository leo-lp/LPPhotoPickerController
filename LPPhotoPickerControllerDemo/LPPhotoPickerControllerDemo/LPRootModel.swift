//
//  LPRootModel.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/6/28.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

enum YLRootValue {
    case isOn(Bool)
    case number(Int)
}

class LPRootModel {
    var title: String
    var value: YLRootValue
    
    init(title: String, value: YLRootValue) {
        self.title = title
        self.value = value
    }
}
