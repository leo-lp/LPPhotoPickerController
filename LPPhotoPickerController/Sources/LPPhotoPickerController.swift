//
//  LPPhotoPickerController.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

public class LPPhotoPickerController: UINavigationController {
    var config: LPPhotoPickerConfiguration
    
    // MARK: - init / deinit
    
    deinit {
        #if DEBUG
        print("LPPhotoPickerController: -> release memory.")
        #endif
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 初始化以图片选择
    public init(with config: LPPhotoPickerConfiguration) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
        //        YLImageManager.shared.options.columnNumber = columnNumber
        self.viewControllers = [LPPhotoListController()]
    }
    
    //    /// 初始化以图片预览
    //    init(photos: [UIImage], assets: [PHAsset], index: Int, allowSelect: Bool) {
    //        super.init(nibName: nil, bundle: nil)
    //        self.selectedAssets = assets
    //        self.checkSelectedAssets()
    //
    //        let previewType: YLPhotoPreviewType = .selected(selectedModels)
    //        let previewVc = YLPhotoPreviewController(type: previewType, index: index)
    //        previewVc.vm.isSelectOriginalPhoto = isSelectOriginalPhoto
    //        self.viewControllers = [previewVc]
    //    }
    //
    //    /// 初始化以网络图片预览
    //    ///
    //    /// - Parameters:
    //    ///   - baseURL: 网络图片的baseURL
    //    ///   - pngList: 网络图片名列表
    //    ///   - singleSize: 单一图片的尺寸
    //    ///   - index: 图片预览索引
    //    init(baseURL: String, pngList: [String], singleSize: CGSize?, index: YLIndex, ivs: [UIImageView]) {
    //        super.init(nibName: nil, bundle: nil)
    //        let previewType: YLPhotoPreviewType = .network(baseURL, pngList, singleSize)
    //        let previewVc = YLPhotoPreviewController(type: previewType, index: index)
    //        viewControllers = [previewVc]
    //        view.backgroundColor = UIColor.black
    //        modalPresentationStyle = .overFullScreen
    //
    //        let model = YLBeginFromCurrentIvFrameModel(ivs: ivs, index: index)
    //        let manager = YLPresentationManager(.center(nil),
    //                                            animationType: .beginFromCurrentIvFrame,
    //                                            dismissOfTap: false)
    //        manager.animationModel = model
    //        yl_presentationManager = manager
    //    }
    
    //    // MARK: - override
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        YLHangUpView.shared.isHidden = false
    //        YLProgressHUD.hide(false)
    //    }
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        view.backgroundColor = UIColor.white
    //        YLHangUpView.shared.isHidden = true
    //    }

}
