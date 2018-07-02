//
//  LPRootSelectedPhotoCell.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

class LPRootSelectedPhotoCell: UICollectionViewCell {
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 4.0
        imageView.layer.masksToBounds = true
    }
    
    func bind(with indexPath: IndexPath, selectedPhotos: [UIImage]) {
        let maxCount = LPRootSelectedPhotosView.maxSelectedPhotoCount
        
        if indexPath.item == selectedPhotos.count {
            imageView.image = #imageLiteral(resourceName: "imagePicker_btn")
            deleteButton.isHidden = true
            isHidden = selectedPhotos.count >= maxCount
            
            imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
            imageView.layer.borderWidth = 0.5
        } else {
            imageView.image = selectedPhotos[indexPath.item]
            deleteButton.isHidden = false
            isHidden = false
            
            imageView.layer.borderColor = UIColor.clear.cgColor
            imageView.layer.borderWidth = 0.5
        }
    }
    
}
