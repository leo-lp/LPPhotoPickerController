//
//  LPRootCell.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/6/28.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

class LPRootCell: UITableViewCell {
    func bindData(with model: LPRootModel) { }
}

class LPRootSwitchCell: LPRootCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    override func bindData(with model: LPRootModel) {
        self.titleLabel.text = model.title
        if case .isOn(let value) = model.value {
            self.switch.isOn = value
        }
    }
}

class LPRootTextFieldCell: LPRootCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func bindData(with model: LPRootModel) {
        titleLabel.text = model.title
        if case .number(let value) = model.value {
            textField.text = "\(value)"
        }
    }
}
