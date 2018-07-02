//
//  LPPhotoListController.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit
import Photos

public class LPPhotoListController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
    }
    
}

//    private var collectionView: YLCollectionView?
//    private var authorizationView: YLAuthorizationView?
//    private lazy var albumsView: YLAlbumListView = {
//        let albums = YLAlbumListView(at: self.view)
//        albums.delegate = self
//        albums.closeButton.addTarget(self, action: #selector(closeAlbumsButtonClicked), for: .touchUpInside)
//        return albums
//    }()
//
//    let vm = YLPhotoPickerViewModel()
//    lazy var cameraManager = YLCameraManager()
//
//    var titleView: YLPhotoPickerTitleView? {
//        return navigationItem.titleView as? YLPhotoPickerTitleView
//    }
//    var imageNavigationController: YLImageNavigationController? {
//        return navigationController as? YLImageNavigationController
//    }
//
//    deinit {
//        yalog.warning("release memory.")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        guard let imgNavCtrl = imageNavigationController else { return }
//        imgNavCtrl.isSelectOriginalPhoto = vm.isSelectOriginalPhoto
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: true)
//
//        YLImageManager.shared.requestAuthorization { [weak self](authorized) in
//            guard let `self` = self else { return }
//
//            if authorized {
//                if let authorizationView = self.authorizationView {
//                    authorizationView.removeFromSuperview()
//                    self.authorizationView = nil
//                }
//                self.vm.fetchCameraRollAlbum { [weak self] in
//                    guard let `self` = self else { return }
//                    self.initSubviews()
//                    self.albumsView.loadAlbums(with: [])
//                }
//
//                self.titleView?.isHidden = false
//            } else if self.authorizationView == nil
//                , let authorizationView = YLAuthorizationView.instance() {
//
//                self.view.addSubview(authorizationView)
//                self.authorizationView = authorizationView
//
//                authorizationView.translatesAutoresizingMaskIntoConstraints = false
//                let t = authorizationView.topAnchor.constraint(equalTo: self.view.topAnchor)
//                let l = authorizationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
//                let r = authorizationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//                let b = authorizationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//                NSLayoutConstraint.activate([t, l, r, b])
//
//                self.titleView?.isHidden = true
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        guard let imgNavCtrl = imageNavigationController else { return }
//
//        vm.isSelectOriginalPhoto = imgNavCtrl.isSelectOriginalPhoto
//
//        view.backgroundColor = UIColor.white
//        let right = UIBarButtonItem(title: YLLocalizedString("imagePicker.Done"),
//                                    style: .plain,
//                                    target: self,
//                                    action: #selector(doneButtonClicked))
//        let left = UIBarButtonItem(image: #imageLiteral(resourceName: "moment_post_close"),
//                                   style: .plain,
//                                   target: self,
//                                   action: #selector(cancelButtonClicked))
//        navigationItem.rightBarButtonItem = right
//        navigationItem.leftBarButtonItem = left
//
//        let albumsButton = YLPhotoPickerTitleView()
//        navigationItem.titleView = albumsButton
//        albumsButton.addTarget(self, action: #selector(albumsButtonClicked), for: .touchUpInside)
//
//        refreshButtonStatus()
//    }
//}
//
//// MARK: - Fetch & Check Asset
//
//extension YLPhotoPickerController {
//
//    private func initSubviews() {
//        YLProgressHUD.hide(false)
//        guard let imgNavCtrl = self.imageNavigationController else { return }
//        titleView?.title = self.vm.model?.name
//
//        vm.checkSelectedModels(with: imgNavCtrl.selectedModels)
//
//        setupCollectionView(with: imgNavCtrl)
//        collectionView?.isHidden = true
//        collectionView?.reloadData()
//        scrollCollectionViewToBottom()
//    }
//
//    private func setupCollectionView(with imgNavCtrl: YLImageNavigationController) {
//        guard collectionView == nil else { return }
//
//        let column = CGFloat(YLImageManager.shared.options.columnNumber)
//        let itemWH: CGFloat = (UIScreen.main.bounds.width - (column - 1) * vm.itemMargin) / column
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: itemWH, height: itemWH)
//        layout.minimumLineSpacing = vm.itemMargin
//        layout.minimumInteritemSpacing = vm.itemMargin
//        let collection = YLCollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.backgroundView = nil
//        collection.backgroundColor = UIColor.white
//        collection.dataSource = self
//        collection.delegate = self
//        collection.alwaysBounceHorizontal = false
//
//        let count = CGFloat(vm.model?.count ?? 0)
//        if vm.showTakePhotoButton {
//            collection.contentSize = CGSize(width: view.frame.width,
//                                            height: ((count + column) / column) * view.frame.width)
//        } else {
//            collection.contentSize = CGSize(width: view.frame.width,
//                                            height: ((count + column - 1) / column) * view.frame.width)
//        }
//        view.insertSubview(collection, at: 0)
//
//        collection.register(YLPhotoPickerAssetCell.self,
//                            forCellWithReuseIdentifier: "YLPhotoPickerAssetCell")
//        collection.register(YLPhotoPickerAssetCameraCell.self,
//                            forCellWithReuseIdentifier: "YLPhotoPickerAssetCameraCell")
//        collectionView = collection
//
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        let t = collection.topAnchor.constraint(equalTo: view.topAnchor)
//        let l = collection.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let r = collection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        let b = collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        NSLayoutConstraint.activate([t, l, r, b])
//    }
//
//    private func scrollCollectionViewToBottom() {
//        if vm.shouldScrollToBottom, let models = vm.models, models.count > 0 {
//            var item: Int = 0
//            let options = YLImageManager.shared.options
//            if options.sortAscendingByModificationDate {
//                item = models.count - 1
//                if vm.showTakePhotoButton && options.allowPickingImage {
//                    item += 1
//                }
//            }
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: { [weak self] in
//                guard let `self` = self, let collection = self.collectionView else { return }
//                collection.scrollToItem(at: IndexPath(item: item, section: 0), at: .bottom, animated: false)
//                self.vm.shouldScrollToBottom = false
//                collection.isHidden = false
//            })
//        } else {
//            collectionView?.isHidden = false
//        }
//    }
//}
//
//// MARK: - Action
//
//extension YLPhotoPickerController {
//
//    @objc func doneButtonClicked() {
//        guard let imgNavCtrl = imageNavigationController else { return }
//        YLProgressHUD.showHUD(nil, inView: imgNavCtrl.view)
//
//        let count = imgNavCtrl.selectedModels.count
//        var assets: [Any] = Array(repeating: NSNumber(value: 1), count: count)
//        var photos: [Any] = Array(repeating: NSNumber(value: 1), count: count)
//
//        var havenotShowAlert: Bool = true
//        for (idx, model) in imgNavCtrl.selectedModels.enumerated() {
//            YLImageManager.shared.photo(with: model.asset, completion: { (photo, info, isDegraded) in
//                if isDegraded { return }
//                if var photo = photo {
//                    let photoWidth = YLImageManager.shared.options.photoWidth
//                    let size = CGSize(width: photoWidth,
//                                      height: photoWidth * photo.size.height / photo.size.width)
//                    photo = YLImageManager.shared.scaleImage(photo, toSize: size)
//
//                    photos.remove(at: idx)
//                    photos.insert(photo, at: idx)
//                }
//
//                assets.remove(at: idx)
//                assets.insert(model.asset, at: idx)
//
//                for item in photos where item is NSNumber {
//                    return
//                }
//
//                if havenotShowAlert {
//                    YLProgressHUD.hide(true)
//                    self.didGetAllPhotos(assets: assets, photos: photos)
//                }
//            }, progressHandler: { (progress, error, stop, info) in
//                if error != nil {
//                    havenotShowAlert = true
//                } else {
//                    // 如果图片正在从iCloud同步中,提醒用户
//                    if progress < 1 && havenotShowAlert {
//                        let text = YLLocalizedString("imagePicker.SynciCloudPhotos")
//                        YLProgressHUD.showHUD(text, inView: imgNavCtrl.view)
//                        havenotShowAlert = false
//                        return
//                    }
//                    if progress >= 1 {
//                        havenotShowAlert = true
//                    }
//                }
//            }, networkAccess: true)
//        }
//
//        if imgNavCtrl.selectedModels.count <= 0 {
//            didGetAllPhotos(assets: assets, photos: photos)
//        }
//    }
//
//    @objc func cancelButtonClicked() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    private func didGetAllPhotos(assets: [Any], photos: [Any]) {
//        YLProgressHUD.hide(false)
//        guard let imgNavCtrl = imageNavigationController
//            , let photos = photos as? [UIImage]
//            , let assets = assets as? [PHAsset] else { return }
//        imgNavCtrl.pickerDelegate?.imageNavigationController(imgNavCtrl,
//                                                             didFinishPicking: photos,
//                                                             source: assets,
//                                                             isSelectOriginalPhoto: vm.isSelectOriginalPhoto)
//        dismiss(animated: true, completion: nil)
//    }
//
//    @objc func albumsButtonClicked() {
//        guard let imgNavCtrl = imageNavigationController else { return }
//
//        albumsView.isOpen = !albumsView.isOpen
//        titleView?.isOpen = albumsView.isOpen
//
//        if albumsView.isOpen {
//            albumsView.loadAlbums(with: imgNavCtrl.selectedModels)
//        }
//    }
//
//    @objc func closeAlbumsButtonClicked() {
//        albumsView.isOpen = !albumsView.isOpen
//        titleView?.isOpen = albumsView.isOpen
//    }
//}
//
//// MARK: - Delegate
//
//extension YLPhotoPickerController: UICollectionViewDataSource, UICollectionViewDelegate, YLPhotoPickerAssetCellDelegate, UITableViewDelegate, YLCameraManagerDelegate {
//
//    // MARK: - UITableViewDelegate
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        guard albumsView.albums.count > indexPath.item else { return }
//
//        let model = albumsView.albums[indexPath.item]
//        vm.model = model
//        vm.models = nil
//        vm.fetchAssetModels { [weak self] in
//            self?.initSubviews()
//        }
//        albumsView.isOpen = !albumsView.isOpen
//        titleView?.isOpen = albumsView.isOpen
//    }
//
//    // MARK: - UICollectionView DataSource & Delegate
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return vm.numberOfItemsInSection()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return vm.collectionView(collectionView, cellForItemAt: indexPath, delegate: self)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let models = vm.models else { return }
//        /// 去拍照
//        let isSort = YLImageManager.shared.options.sortAscendingByModificationDate
//        if ((isSort && indexPath.item >= models.count) || (!isSort && indexPath.item == 0))
//            && vm.showTakePhotoButton {
//            return cameraManager.takePhoto(at: self, delegate: self)
//        }
//
//        ///  预览照片
//        var index: Int = indexPath.item
//        if !isSort && vm.showTakePhotoButton {
//            index = indexPath.item - 1
//        }
//
//        let model = models[index]
//        if model.type == .photo || model.type == .gif {
//            let previewVc = YLPhotoPreviewController(type: .album(models), index: index)
//            previewVc.vm.isSelectOriginalPhoto = vm.isSelectOriginalPhoto
//            previewVc.vm.backButtonClickedBlock = { [weak self](isSelectOriginalPhoto) in
//                guard let `self` = self else { return }
//                self.vm.isSelectOriginalPhoto = isSelectOriginalPhoto
//                self.collectionView?.reloadData()
//                self.refreshButtonStatus()
//            }
//            previewVc.vm.doneButtonClickedBlock = { [weak self](isSelectOriginalPhoto) in
//                guard let `self` = self else { return }
//                self.vm.isSelectOriginalPhoto = isSelectOriginalPhoto
//                self.doneButtonClicked()
//            }
//            navigationController?.pushViewController(previewVc, animated: true)
//        }
//    }
//
//    // MARK: - YLPhotoPickerAssetCellDelegate
//
//    func photoPickerAssetCell(_ cell: YLPhotoPickerAssetCell, selectButtonClicked isSelected: Bool) {
//        guard let imgNavCtrl = imageNavigationController, let model = cell.model else { return }
//
//        if isSelected {
//            cell.selectPhotoButton.isSelected = false
//            model.isSelected = false
//
//            let selectedModels = imgNavCtrl.selectedModels
//            for (idx, item) in selectedModels.enumerated()
//                where model.asset.localIdentifier == item.asset.localIdentifier {
//                imgNavCtrl.selectedModels.remove(at: idx)
//                break
//            }
//
//            if let models = vm.models {
//                let selectedIndexPaths = imgNavCtrl.selectedModels.compactMap({ (selectedModel) -> IndexPath? in
//                    for (idx, model) in models.enumerated() {
//                        if selectedModel.asset.localIdentifier == model.asset.localIdentifier {
//                            if !YLImageManager.shared.options.sortAscendingByModificationDate
//                                && vm.showTakePhotoButton {
//                                return IndexPath(item: idx + 1, section: 0)
//                            }
//                            return IndexPath(item: idx, section: 0)
//                        }
//                    }
//                    return nil
//                })
//                //UIView.setAnimationsEnabled(false)
//                collectionView?.reloadItems(at: selectedIndexPaths)
//                //UIView.setAnimationsEnabled(true)
//            }
//
//            cell.selectedCount = 0
//            refreshButtonStatus()
//        } else {
//            if imgNavCtrl.selectedModels.count < imgNavCtrl.maxImagesCount {
//                cell.selectPhotoButton.isSelected = true
//                model.isSelected = true
//
//                imgNavCtrl.selectedModels.append(model)
//
//                cell.selectedCount = imgNavCtrl.selectedModels.count
//                refreshButtonStatus()
//            } else {
//                YLProgressHUD.showText(YLLocalizedString("imagePicker.Limit_9_Photos"))
//            }
//        }
//    }
//
//    // MARK: - YLCameraManagerDelegate
//
//    func reloadPhotos(in manager: YLCameraManager) {
//        vm.reloadPhotos { [weak self](model) in
//            guard let `self` = self
//                , let imgNavCtrl = self.imageNavigationController else { return }
//            if imgNavCtrl.maxImagesCount <= 1 {
//                imgNavCtrl.selectedModels.append(model)
//                self.doneButtonClicked()
//                return
//            }
//
//            if imgNavCtrl.selectedModels.count < imgNavCtrl.maxImagesCount {
//                model.isSelected = true
//                imgNavCtrl.selectedModels.append(model)
//                self.refreshButtonStatus()
//            }
//
//            self.collectionView?.isHidden = true
//            self.collectionView?.reloadData()
//
//            self.vm.shouldScrollToBottom = true
//            self.scrollCollectionViewToBottom()
//            self.albumsView.loadAlbums(with: imgNavCtrl.selectedModels)
//        }
//    }
//
//    private func refreshButtonStatus() {
//        guard let imgNavCtrl = imageNavigationController else { return }
//        let isEnabled = imgNavCtrl.selectedModels.count > 0 || vm.alwaysEnableDoneButton
//        navigationItem.rightBarButtonItem?.isEnabled = isEnabled
//    }
//}
//
//extension YLPhotoPickerController {
//
//    class YLCollectionView: UICollectionView {
//        override func touchesShouldCancel(in view: UIView) -> Bool {
//            if view is UIControl {
//                return true
//            }
//            return super.touchesShouldCancel(in: view)
//        }
//    }
//}
