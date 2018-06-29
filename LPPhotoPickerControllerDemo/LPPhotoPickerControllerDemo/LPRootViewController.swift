//
//  LPRootViewController.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/6/28.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

class LPRootViewController: UITableViewController {
    let vm = LPRootViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return vm.configCell(for:tableView, at:indexPath)
    }
    
    
}
