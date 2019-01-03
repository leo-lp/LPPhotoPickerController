//
//  LPPhotoModel.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/3.
//  Copyright © 2018年 pengli. All rights reserved.
//

import Photos

//enum YLAssetMediaType {
//    case photo
//    case gif
//    case video
//    case audio
//}
//
//class YLAssetModel: Equatable {
//    var type: YLAssetMediaType
//    var asset: PHAsset
//    var isSelected: Bool // The select status of a photo, default is false
//    var timeLength: String?
//
//    init(asset: PHAsset, type: YLAssetMediaType, timeLength: String? = nil) {
//        self.asset = asset
//        self.type = type
//        self.timeLength = timeLength
//        self.isSelected = false
//    }
//
//    static func ==(lhs: YLAssetModel, rhs: YLAssetModel) -> Bool {
//        return lhs.asset.localIdentifier == rhs.asset.localIdentifier
//    }
//}
//
public class LPAlbum {
    //    let name: String // The album name
    //    let result: PHFetchResult<PHAsset>
    //    let count: Int   // Count of photos the album contain
    //    var isCameraRoll: Bool
    //
    //    var selectedCount: Int = 0
    //    var models: [YLAssetModel]?
    //    var selectedModels: [YLAssetModel]? {
    //        didSet {
    //            if models != nil { checkSelectedModels() }
    //        }
    //    }
    //
    //    init(result: PHFetchResult<PHAsset>, name: String, isCameraRoll: Bool, isFetchAssets: Bool) {
    //        self.result = result
    //        self.name = name
    //        self.isCameraRoll = isCameraRoll
    //        self.count = result.count
    //
    //        if isFetchAssets {
    //            YLImageManager.shared.assets(from: result, completion: { (ms) in
    //                models = ms
    //                if selectedModels != nil {
    //                    checkSelectedModels()
    //                }
    //            })
    //        }
    //    }
    //
    //    private func checkSelectedModels() {
    //        selectedCount = 0
    //        var selectedAssets: [PHAsset] = []
    //        if let selectedModels = selectedModels {
    //            for model in selectedModels {
    //                selectedAssets.append(model.asset)
    //            }
    //        }
    //        if let models = models {
    //            for model in models {
    //                if selectedAssets.contains(model.asset) {
    //                    selectedCount += 1
    //                }
    //            }
    //        }
    //    }
}
