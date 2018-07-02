//
//  LPPhotoPickerProtocol.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit
import Photos

public protocol LPPhotoPickerControllerDelegate: class {

    func photoPickerController(_ controller: LPPhotoPickerController,
                               didFinishPicking photos: [UIImage],
                               source assets: [PHAsset],
                               isSelectOriginalPhoto: Bool)
}
