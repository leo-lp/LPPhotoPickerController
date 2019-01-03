//
//  LPPhotoPickerConfiguration.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

public class LPPhotoPickerConfiguration {
    
    weak var delegate: LPPhotoPickerControllerDelegate?
    
    /// 默认最大可选9张图片
    var maxPhotosCount: Int = 9
    
    /// 是否选择原图
    var isSelectOriginalPhoto: Bool = false
    
    public init() { }
    
    //    var selectedModels: [YLAssetModel] = [] // 用户选中过的图片数组
    //    var selectedAssets: [PHAsset] = [] { // 用户选中过的图片数组
    //        didSet { checkSelectedAssets() }
    //    }
    
    //    private func checkSelectedAssets() {
    //        for asset in selectedAssets {
    //            let type = YLImageManager.shared.assetType(with: asset)
    //            let model = YLAssetModel(asset: asset, type: type)
    //            model.isSelected = true
    //            selectedModels.append(model)
    //        }
    //    }
}
