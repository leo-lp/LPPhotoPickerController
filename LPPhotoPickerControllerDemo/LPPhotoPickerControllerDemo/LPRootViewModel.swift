//
//  LPRootViewModel.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/6/28.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

class LPRootViewModel {
    var models: [LPRootModel] = {
        return [LPRootModel(title: "1", value: .isOn(true)),
                LPRootModel(title: "2", value: .isOn(true)),
                LPRootModel(title: "3", value: .number(1)),
                LPRootModel(title: "4", value: .number(2))]
    }()
    
    func configCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        var id: String
        switch model.value {
        case .isOn: id = "LPRootSwitchCell"
        case .number: id = "LPRootTextFieldCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! LPRootCell
        cell.bindData(with: model)
        return cell
    }
    
    
}
