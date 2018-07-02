//
//  LPPhotoListViewModel.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

public class LPPhotoListViewModel {
//    let itemMargin: CGFloat = 1.0
//
//    var alwaysEnableDoneButton: Bool = false // 让完成按钮一直可以点击，无须最少选择一张图片
//    var showTakePhotoButton: Bool { return model?.isCameraRoll ?? false }
//    var shouldScrollToBottom: Bool = true
//
//    var isSelectOriginalPhoto: Bool = false
//
//    var model: YLAlbumModel?
//    var models: [YLAssetModel]?
}

//// MARK: - Func
//
//extension YLPhotoPickerViewModel {
//
//    func fetchCameraRollAlbum(_ completion: @escaping () -> Void) {
//        guard models == nil else { return }
//        YLImageManager.shared.cameraRollAlbum(isFetchAssets: false) { [weak self](model) in
//            guard let `self` = self else { return }
//            self.model = model
//            self.fetchAssetModels(completion)
//        }
//    }
//
//    func fetchAssetModels(_ completion: @escaping () -> Void) {
//        guard let model = model else { return }
//
//        if model.models?.count == 0 {
//            YLProgressHUD.showHUD(nil)
//        }
//
//        DispatchQueue.global().async { [weak self] in
//            guard let `self` = self else { return }
//
//            if YLImageManager.shared.options.sortAscendingByModificationDate
//                && model.isCameraRoll {
//                YLImageManager.shared.cameraRollAlbum(isFetchAssets: true, completion: { (model) in
//                    self.model = model
//                    self.models = model.models
//
//                    DispatchQueue.main.safeAsync { completion() }
//                })
//            } else {
//                if self.showTakePhotoButton {
//                    YLImageManager.shared.assets(from: model.result, completion: { (models) in
//                        self.models = models
//                        DispatchQueue.main.safeAsync { completion() }
//                    })
//                } else {
//                    self.models = model.models
//                    DispatchQueue.main.safeAsync { completion() }
//                }
//            }
//        }
//    }
//
//    func checkSelectedModels(with selectedModels: [YLAssetModel]) {
//        guard let models = models else { return }
//
//        for model in models {
//            model.isSelected = false
//
//            var selectedAssets: [PHAsset] = []
//            for model in selectedModels {
//                selectedAssets.append(model.asset)
//            }
//
//            if selectedAssets.contains(model.asset) {
//                model.isSelected = true
//            }
//        }
//    }
//
//    func reloadPhotos(_ completion: (YLAssetModel) -> Void) {
//        YLImageManager.shared.cameraRollAlbum(isFetchAssets: false) { [weak self](model) in
//            guard let `self` = self else { return }
//            self.model = model
//            YLImageManager.shared.assets(from: model.result, completion: { (models) in
//                YLProgressHUD.hide(false)
//                var assetModel: YLAssetModel?
//                if YLImageManager.shared.options.sortAscendingByModificationDate {
//                    if let last = models.last {
//                        assetModel = last
//                        self.models?.append(last)
//                    }
//                } else {
//                    if let first = models.first {
//                        assetModel = first
//                        self.models?.insert(first, at: 0)
//                    }
//                }
//
//                if let assetModel = assetModel {
//                    completion(assetModel)
//                }
//            })
//        }
//    }
//}
//
//extension YLPhotoPickerViewModel {
//
//    func numberOfItemsInSection() -> Int {
//        let number = models?.count ?? 0
//        guard showTakePhotoButton
//            , YLImageManager.shared.options.allowPickingImage else { return number }
//        return number + 1
//    }
//
//    func collectionView(_ collection: UICollectionView,
//                        cellForItemAt indexPath: IndexPath,
//                        delegate: (YLPhotoPickerAssetCellDelegate & YLPhotoPickerController)?) -> UICollectionViewCell {
//        //UIView.setAnimationsEnabled(false)
//
//        let isSort = YLImageManager.shared.options.sortAscendingByModificationDate
//        let flag1 = (isSort && indexPath.item >= (models?.count ?? 0))
//        let flag2 = (!isSort && indexPath.item == 0)
//        if ((flag1 || flag2) && showTakePhotoButton) {
//            return collection.dequeueReusableCell(withReuseIdentifier: "YLPhotoPickerAssetCameraCell", for: indexPath)
//        }
//
//        let cell = collection.dequeueReusableCell(withReuseIdentifier: "YLPhotoPickerAssetCell",
//                                                  for: indexPath) as! YLPhotoPickerAssetCell
//
//        let index: Int
//        if isSort || !showTakePhotoButton {
//            index = indexPath.item
//        } else {
//            index = indexPath.item - 1
//        }
//
//        if let assetModel = models?[index], let imgNavCtrl = delegate?.imageNavigationController {
//            cell.bindData(with: assetModel, delegate: delegate)
//
//            let id1 = assetModel.asset.localIdentifier
//            for (idx, selectedModel) in imgNavCtrl.selectedModels.enumerated() {
//                let id2 = selectedModel.asset.localIdentifier
//                if id1 == id2 {
//                    cell.selectedCount = idx + 1
//                }
//            }
//        }
//
//        //UIView.setAnimationsEnabled(true)
//        return cell
//    }
//}
