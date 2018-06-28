//
//  LPRootModel.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/6/28.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

enum YLRootCellValue {
    case isOn(Bool)
    case number(Int)
}

struct LPRootModel {
    var title: String
    var value: YLRootCellValue
}
