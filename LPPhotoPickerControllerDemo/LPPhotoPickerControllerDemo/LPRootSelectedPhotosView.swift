//
//  LPRootSelectedPhotosView.swift
//  LPPhotoPickerControllerDemo
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit
import LPPhotoBrowser
import LPPhotoPickerController

//protocol YLMomentPostImageCellDelegate: class {
//    func momentPostImageCell(in cell: YLMomentPostImageCell, didChange selectedImages: [UIImage])
//}

class LPRootSelectedPhotosView: UIView {
    static let maxSelectedPhotoCount: Int = 9 // 最多可选择图片数量
    
    lazy var selectedPhotos: [UIImage] = [] // 当前已经选择的图片

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemWH: CGFloat = (UIScreen.main.bounds.width - 15 * 4) / 3
        layout.itemSize = CGSize(width: itemWH, height: itemWH)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 15
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.alwaysBounceVertical = false
        collection.backgroundView = nil
        collection.isScrollEnabled = false
        collection.backgroundColor = UIColor.white
        collection.contentInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nibCell = UINib(nibName: "LPRootSelectedPhotoCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "LPRootSelectedPhotoCell")
        addSubview(collectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    
    @objc private func deleteButtonClicked(_ sender: UIButton) {
        //        let index = sender.tag
        //        guard index >= 0 && selectedImages.count > index else { return }
        //
        //        selectedImages.remove(at: index)
        //        selectedAssets.remove(at: index)
        //        collectionView.performBatchUpdates({
        //            let indexPath = IndexPath(item: index, section: 0)
        //            collectionView.deleteItems(at: [indexPath])
        //        }) { [weak self](finished) in
        //            guard let `self` = self else { return }
        //            self.collectionView.reloadData()
        //            self.delegate?.momentPostImageCell(in: self, didChange: self.selectedImages)
        //        }
    }
}

// MARK: - UICollectionView DataSource, Delegate

extension LPRootSelectedPhotosView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedPhotos.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPRootSelectedPhotoCell", for: indexPath) as! LPRootSelectedPhotoCell
        cell.bind(with: indexPath, selectedPhotos: selectedPhotos)
        cell.deleteButton.tag = indexPath.item
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonClicked), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let topVC = UIViewController.topController() else { return }

        /// 添加图片
        if indexPath.item == selectedPhotos.count {
            let config = LPPhotoPickerConfiguration()
            let pickerVc = LPPhotoPickerController(with: config)
            
            //imageNavCtrl.isSelectOriginalPhoto = isSelectOriginalPhoto
            //imageNavCtrl.selectedAssets = selectedAssets // 设置目前已经选中的图片数组
            topVC.present(pickerVc, animated: true, completion: nil)
            return
        }
//
//        /// 大图查看图片
//        let imageNavCtrl = YLImageNavigationController(photos: selectedImages,
//                                                       assets: selectedAssets,
//                                                       index: indexPath.item,
//                                                       allowSelect: false)
//        imageNavCtrl.isSelectOriginalPhoto = isSelectOriginalPhoto
//        topVC.present(imageNavCtrl, animated: true, completion: nil)
    }
}

//// MARK: - YLImageNavigationController
//
//extension YLMomentPostImageCell: YLImageNavigationControllerDelegate {
//
//    // MARK: - YLImageNavigationControllerDelegate
//
//    func imageNavigationController(_ controller: YLImageNavigationController, didFinishPicking photos: [UIImage], source assets: [PHAsset], isSelectOriginalPhoto: Bool) {
//        selectedImages = photos
//        selectedAssets = assets
//        self.isSelectOriginalPhoto = isSelectOriginalPhoto
//        collectionView.reloadData()
//
//        delegate?.momentPostImageCell(in: self, didChange: selectedImages)
//    }
//}
