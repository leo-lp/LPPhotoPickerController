//
//  LPPhotoSessionConfiguration.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/3.
//  Copyright © 2018年 pengli. All rights reserved.
//

import Photos

//protocol YLImageManagerDelegate: class {
//    /// 决定相册显示与否 albumName:相册名字 result:相册原始数据
//    func isAlbumCanSelect(to albumName: String, result: PHFetchResult<PHAsset>) -> Bool
//
//    /// 决定照片显示与否
//    func isAssetCanSelect(to asset: PHAsset) -> Bool
//}

public class LPPhotoSessionConfiguration {
    //    init() { renewYLScreenWidth() }
    //
    //    weak var delegate: YLImageManagerDelegate?
    //
    //    var ylAssetGridThumbnailSize: CGSize = .zero
    //    var ylScreenWidth: CGFloat = 0.0
    //    var ylScreenScale: CGFloat = 0.0
    
    /// 是否允许选择照片
    public var allowPickingPhoto: Bool = true
    
    /// 是否允许选择视频
    public var allowPickingVideo: Bool = true
    
    /// 默认最新的照片会显示在最前面，内部的拍照按钮会排在第一个；如果设置为true对照片按修改时间升序排列。
    public var sortAscendingByModificationDate: Bool = false
    
    //    /// 最小可选中的图片宽/高度，默认是0，小于这个宽度的图片不可选中
    //    var minPhotoWidthSelectable: Int = 0
    //    var minPhotoHeightSelectable: Int = 0
    //    var hideWhenCanNotSelect: Bool = false // 当不能选择时隐藏
    //
    //    var photoPreviewMaxWidth: CGFloat = 600.0 // 默认600像素宽（推荐：500~800）
    //
    //    var photoWidth: CGFloat = 828.0 { // 导出图片的宽度，默认828像素宽
    //        didSet {
    //            ylScreenWidth = photoWidth / 2
    //        }
    //    }
    //    var columnNumber: Int = 4 {
    //        didSet {
    //            renewYLScreenWidth()
    //            let margin: CGFloat = 4.0
    //            let itemWH: CGFloat = (ylScreenWidth - 2.0 * margin - 4) / CGFloat(columnNumber) - margin
    //            ylAssetGridThumbnailSize = CGSize(width: itemWH * ylScreenScale,
    //                                              height: itemWH * ylScreenScale)
    //        }
    //    }
    //
    //    func renewYLScreenWidth() {
    //        ylScreenWidth = UIScreen.main.bounds.width
    //
    //        // 测试发现，如果scale在plus真机上取到3.0，内存会增大特别多。故这里写死成2.0
    //        ylScreenScale = 2.0
    //        if ylScreenWidth > 700 {
    //            ylScreenScale = 1.5
    //        }
    //    }
}

// MARK: - GET

public extension LPPhotoSessionConfiguration {
//
//    var fullScreenWidth: CGFloat {
//        var fullScreenWidth: CGFloat = ylScreenWidth
//        if fullScreenWidth > photoPreviewMaxWidth {
//            fullScreenWidth = photoPreviewMaxWidth
//        }
//        return fullScreenWidth
//    }
//
}
