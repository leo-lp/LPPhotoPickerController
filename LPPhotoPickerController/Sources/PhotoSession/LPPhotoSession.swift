//
//  LPPhotoSession.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import Photos
import LPPhotoBrowser

public class LPPhotoSession: LPPhotoManager {
    public static let shared: LPPhotoSession = { return LPPhotoSession() }()
    
}
//class YLImageManager {
//    static let shared: YLImageManager = { return YLImageManager() }()
//    let options: YLImagePickerOptions = YLImagePickerOptions()
//}
//
//// MARK: - 获取Album（获得相册/相册数组）
//
//extension YLImageManager {
//
//    func cameraRollAlbum(isFetchAssets: Bool, completion: (YLAlbumModel) -> Void) {
//        let option = PHFetchOptions()
//        if !options.allowPickingVideo {
//            option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.image.rawValue)
//        }
//        if !options.allowPickingImage {
//            option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.video.rawValue)
//        }
//        if !options.sortAscendingByModificationDate {
//            option.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        }
//
//        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
//        for idx in 0..<smartAlbums.count {
//            let collection = smartAlbums[idx]
//            /// 过滤空相册
//            if collection.estimatedAssetCount <= 0 {
//                continue
//            }
//            if isCameraRollAlbum(collection) {
//                let fetchResult = PHAsset.fetchAssets(in: collection, options: option)
//                let model = YLAlbumModel(result: fetchResult,
//                                         name: collection.localizedTitle ?? "",
//                                         isCameraRoll: true,
//                                         isFetchAssets: isFetchAssets)
//                return completion(model)
//            }
//        }
//    }
//
//    func allAlbums(isFetchAssets: Bool, completion: ([YLAlbumModel]) -> Void) {
//        var albumArr: [YLAlbumModel] = []
//        let option = PHFetchOptions()
//
//        if !options.allowPickingVideo {
//            option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.image.rawValue)
//        }
//        if !options.allowPickingImage {
//            option.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.video.rawValue)
//        }
//        if !options.sortAscendingByModificationDate {
//            option.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
//        }
//
//        /// 我的照片流 PHFetchResult<PHAssetCollection>, PHFetchResult<PHCollection>, PHFetchResult<PHCollectionList>
//        let myPhotoStreamAlbum = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumMyPhotoStream, options: nil)
//        let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
//        let topLevelUserCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
//        let syncedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumSyncedAlbum, options: nil)
//        let sharedAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumCloudShared, options: nil)
//
//        func process(_ collection: PHAssetCollection) {
//            // 过滤空相册
//            if collection.estimatedAssetCount <= 0 { return }
//
//            let fetchResult = PHAsset.fetchAssets(in: collection, options: option)
//            if fetchResult.count < 1 { return }
//
//            let albumName = collection.localizedTitle ?? ""
//            /// 是否手动控制该相册是否选择
//            if let delegate = options.delegate,
//                !delegate.isAlbumCanSelect(to: albumName, result: fetchResult) { return }
//
//            if albumName.contains("Hidden") || albumName == "已隐藏" { return }
//            if albumName.contains("Deleted") || albumName == "最近删除" { return }
//
//            let isCameraRoll = isCameraRollAlbum(collection)
//            let model = YLAlbumModel(result: fetchResult,
//                                     name: albumName,
//                                     isCameraRoll: isCameraRoll,
//                                     isFetchAssets: isFetchAssets)
//            if isCameraRoll {
//                albumArr.insert(model, at: 0)
//            } else {
//                albumArr.append(model)
//            }
//        }
//
//        for fetchResult in [myPhotoStreamAlbum, smartAlbums, syncedAlbums, sharedAlbums] {
//            for idx in 0..<fetchResult.count {
//                process(fetchResult[idx])
//            }
//        }
//        for idx in 0..<topLevelUserCollections.count {
//            let collection = topLevelUserCollections[idx]
//            //print("cis PHCollectionList=\(collection is PHCollectionList), cis PHAssetCollection=\(collection is PHAssetCollection)")
//            if let collection = collection as? PHAssetCollection {
//                process(collection)
//            }
//        }
//        completion(albumArr)
//    }
//
//    func isCameraRollAlbum(_ metadata: PHAssetCollection) -> Bool {
//        let systemVersion = UIDevice.current.systemVersion
//        var versionStr = systemVersion.replacingOccurrences(of: ".", with: "")
//        if versionStr.count <= 1 {
//            versionStr += "00"
//        } else if versionStr.count <= 2 {
//            versionStr += "0"
//        }
//
//        /// 目前已知8.0.0 ~ 8.0.2系统，拍照后的图片会保存在最近添加中
//        let decimal = NSDecimalNumber(string: versionStr)
//        if decimal == NSDecimalNumber.notANumber {  // indicates parse error
//            return false
//        }
//        let version = decimal.floatValue
//        if version >= 800 && version <= 802 {
//            return metadata.assetCollectionSubtype == .smartAlbumRecentlyAdded
//        } else {
//            return metadata.assetCollectionSubtype == .smartAlbumUserLibrary
//        }
//    }
//}
//
//// MARK: - 获取Assets（获得照片/照片数组）
//
//extension YLImageManager {
//
//    func assets(from result: PHFetchResult<PHAsset>, completion: ([YLAssetModel]) -> Void) {
//        var assetArray: [YLAssetModel] = []
//        result.enumerateObjects { (obj, idx, stop) in
//            if let model = self.assetModel(with: obj) {
//                assetArray.append(model)
//            }
//        }
//        completion(assetArray)
//    }
//
//    func asset(from result: PHFetchResult<PHAsset>, index: YLIndex, completion: (YLAssetModel?) -> Void) {
//        if result.count > index {
//            if let model = assetModel(with: result[index]) {
//                completion(model)
//            }
//        } else {
//            completion(nil)
//        }
//    }
//
//    private func assetModel(with asset: PHAsset) -> YLAssetModel? {
//        if let delegate = options.delegate, !delegate.isAssetCanSelect(to: asset) { return nil }
//
//        let type = assetType(with: asset)
//        if !options.allowPickingVideo && type == .video { return nil }
//        if !options.allowPickingImage && type == .photo { return nil }
//        if !options.allowPickingImage && type == .gif { return nil }
//
//        /// 过滤掉尺寸不满足要求的图片
//        if options.hideWhenCanNotSelect && !isPhotoSelectable(with: asset) { return nil }
//
//        let timeLength: String? = type == .video ? newTime(fromDurationSecond: asset.duration) : nil
//        return YLAssetModel(asset: asset, type: type, timeLength: timeLength)
//    }
//
//    func assetType(with asset: PHAsset) -> YLAssetMediaType {
//        var type = YLAssetMediaType.photo
//        switch asset.mediaType {
//        case .video: type = YLAssetMediaType.video
//        case .audio: type = YLAssetMediaType.audio
//        case .image: // GIF
//            if let filename = asset.value(forKey: "filename") as? String, filename.hasSuffix("GIF") {
//                type = YLAssetMediaType.gif
//            }
//        default: break
//        }
//        return type
//    }
//}
//
//// MARK: - 获得照片本身
//
//extension YLImageManager {
//
//    /// 获得照片本身
//    ///
//    /// - Parameters:
//    ///   - asset: PHAsset
//    ///   - progress: (progress, error, stop, info)
//    ///   - completion: (photo, info, isDegraded)
//    @discardableResult
//    func photo(with asset: PHAsset,
//               completion: @escaping (UIImage?, [AnyHashable: Any]?, Bool) -> Void,
//               photoWidth: CGFloat? = nil,
//               progressHandler: PHAssetImageProgressHandler? = nil,
//               networkAccess: Bool = true) -> PHImageRequestID {
//        let photoWidth = photoWidth ?? options.fullScreenWidth
//        let imageSize: CGSize
//        if photoWidth < options.ylScreenWidth && photoWidth < options.photoPreviewMaxWidth {
//            imageSize = options.ylAssetGridThumbnailSize
//        } else {
//            let aspectRatio = CGFloat(asset.pixelWidth) / CGFloat(asset.pixelHeight)
//            var pixelWidth = photoWidth * options.ylScreenScale * 1.5
//
//            // 超宽图片
//            if aspectRatio > 1.8 {
//                pixelWidth = pixelWidth * aspectRatio
//            }
//            // 超高图片
//            if aspectRatio < 0.2 {
//                pixelWidth = pixelWidth * 0.5
//            }
//            let pixelHeight = pixelWidth / aspectRatio
//            imageSize = CGSize(width: pixelWidth, height: pixelHeight)
//        }
//
//        var image: UIImage?
//        let option = PHImageRequestOptions()
//        option.resizeMode = .fast
//        let imgReqID = PHImageManager.default().requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: option) { (result, info) in
//            if let result = result {
//                image = result
//            }
//            guard let info = info else { return }
//
//            let json = JSON(info)
//            let downloadFinined = (!json[PHImageCancelledKey].boolValue && info[PHImageErrorKey] == nil)
//            if downloadFinined, let result = result {
//                completion(result, info, json[PHImageResultIsDegradedKey].boolValue)
//            }
//
//            /// 从iCloud下载图片
//            if info[PHImageResultIsInCloudKey] != nil && result == nil && networkAccess {
//                let option = PHImageRequestOptions()
//                option.progressHandler = { (progress, error, stop, info) in
//                    DispatchQueue.main.safeAsync {
//                        progressHandler?(progress, error, stop, info)
//                    }
//                }
//                option.isNetworkAccessAllowed = true
//                option.resizeMode = .fast
//                PHImageManager.default().requestImageData(for: asset, options: option, resultHandler: { (imgData, dataUTI, orientation, info) in
//
//                    if let imgData = imgData, let image = UIImage(data: imgData, scale: 0.1) {
//                        completion(image, info, false)
//                    } else if let image = image {
//                        completion(image, info, false)
//                    }
//                })
//            }
//        }
//
//        return imgReqID
//    }
//
//    /// 获取封面图
//    func coverImage(with model: YLAlbumModel, completion: @escaping (UIImage?) -> Void) {
//        let asset: PHAsset?
//        if options.sortAscendingByModificationDate {
//            asset = model.result.lastObject
//        } else {
//            asset = model.result.firstObject
//        }
//        guard let phasset = asset else { return completion(nil) }
//        photo(with: phasset, completion: { (photo, info, isDegraded) in
//            completion(photo)
//        }, photoWidth: 80.0)
//    }
//
//    /// 获取原图：方法completion一般会调多次，一般会先返回缩略图，再返回原图
//    /// 如果info[PHImageResultIsDegradedKey] 为 YES，则表明当前返回的是缩略图，否则是原图。
//    func originalPhoto(with asset: PHAsset, completion: @escaping (UIImage, [AnyHashable: Any]?, Bool) -> Void) {
//        let option = PHImageRequestOptions()
//        option.isNetworkAccessAllowed = true
//        option.resizeMode = .fast
//        PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: option) { (result, info) in
//            if let info = info, !(info[PHImageCancelledKey] as? Bool ?? false), info[PHImageErrorKey] == nil {
//                if let result = result {
//                    let isDegraded = (info[PHImageResultIsDegradedKey] as? Bool) ?? false
//                    completion(result, info, isDegraded)
//                }
//            }
//        }
//    }
//
//    /// 获取原图：该方法中，completion只会走一次 (data, info, isDegraded)
//    func originalPhotoData(with asset: PHAsset, completion: @escaping (Data, [AnyHashable: Any]?, Bool) -> Void) {
//        let option = PHImageRequestOptions()
//        option.isNetworkAccessAllowed = true
//        option.resizeMode = .fast
//        PHImageManager.default().requestImageData(for: asset, options: option) { (imageData, dataUTI, orientation, info) in
//            if let info = info, !(info[PHImageCancelledKey] as? Bool ?? false), info[PHImageErrorKey] == nil {
//                if let imageData = imageData {
//                    completion(imageData, info, false)
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Utils
//
//extension YLImageManager {
//
//    /// 检查照片大小是否满足最小要求
//    func isPhotoSelectable(with asset: PHAsset) -> Bool {
//        if options.minPhotoWidthSelectable > asset.pixelWidth || options.minPhotoHeightSelectable > asset.pixelHeight {
//            return false
//        }
//        return true
//    }
//
//    private func newTime(fromDurationSecond duration: TimeInterval) -> String {
//        let newTime: String
//        if duration < 10 {
//            newTime = String(format: "0:0%zd", duration)
//        } else if duration < 60 {
//            newTime = String(format: "0:%zd", duration)
//        } else {
//            let min = duration / 60
//            let sec = duration - (min * 60)
//            if sec < 10 {
//                newTime = String(format: "%zd:0%zd", min, sec)
//            } else {
//                newTime = String(format: "%zd:%zd", min, sec)
//            }
//        }
//        return newTime
//    }
//
//    /// 缩放图片至新尺寸
//    func scaleImage(_ image: UIImage, toSize: CGSize) -> UIImage {
//        if image.size.width > toSize.width {
//            UIGraphicsBeginImageContext(toSize)
//            image.draw(in: CGRect(x: 0, y: 0, width: toSize.width, height: toSize.height))
//            let newImage = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            return newImage ?? image
//        } else {
//            return image
//        }
//    }
//}
//
