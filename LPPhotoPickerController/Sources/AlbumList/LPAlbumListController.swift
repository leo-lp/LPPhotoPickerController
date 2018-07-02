//
//  LPAlbumListController.swift
//  LPPhotoPickerController
//
//  Created by pengli on 2018/7/2.
//  Copyright © 2018年 pengli. All rights reserved.
//

import UIKit

public class LPAlbumListController: UITableViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Table view data source

    public override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }

}
//class YLAlbumListView: UITableView {
//    private(set) var albums: [YLAlbumModel] = []
//    private(set) var closeButton: UIButton = UIButton()
//
//    var isOpen: Bool = false {
//        didSet {
//            if isOpen {
//                closeButton.alpha = 0.0
//                closeButton.isHidden = false
//            }
//            UIView.animate(withDuration: 0.25, animations: {
//                if self.isOpen {
//                    self.transform = CGAffineTransform(translationX: 0, y: 250)
//                    self.closeButton.alpha = 1.0
//                } else {
//                    self.transform = CGAffineTransform.identity
//                    self.closeButton.alpha = 0.0
//                }
//            }) { (finished) in
//                if !self.isOpen {
//                    self.closeButton.isHidden = true
//                }
//            }
//        }
//    }
//
//    deinit {
//        yalog.warning("release memory.")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init(at superView: UIView) {
//        super.init(frame: .zero, style: .plain)
//        superView.addSubview(self)
//        translatesAutoresizingMaskIntoConstraints = false
//
//        let h = heightAnchor.constraint(equalToConstant: 250)
//        let l = leadingAnchor.constraint(equalTo: superView.leadingAnchor)
//        let r = trailingAnchor.constraint(equalTo: superView.trailingAnchor)
//        let b = bottomAnchor.constraint(equalTo: superView.topAnchor)
//        NSLayoutConstraint.activate([h, l, r, b])
//
//        backgroundView = nil
//        backgroundColor = UIColor.white
//        separatorColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8862745098, alpha: 1)
//        separatorInset = UIEdgeInsets(top: 0, left: 65, bottom: 0, right: 0)
//        rowHeight = 50.0
//        tableHeaderView = UIView()
//        tableFooterView = UIView()
//        dataSource = self
//        register(UINib(nibName: "YLAlbumListCell", bundle: nil), forCellReuseIdentifier: "YLAlbumListCell")
//
//        addCoverView(at: superView)
//    }
//
//    private func addCoverView(at superView: UIView) {
//        closeButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
//        closeButton.alpha = 0.0
//        closeButton.isHidden = true
//        superView.insertSubview(closeButton, belowSubview: self)
//        closeButton.translatesAutoresizingMaskIntoConstraints = false
//
//        let t = closeButton.topAnchor.constraint(equalTo: bottomAnchor)
//        let l = closeButton.leadingAnchor.constraint(equalTo: superView.leadingAnchor)
//        let r = closeButton.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
//        let b = closeButton.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
//        NSLayoutConstraint.activate([t, l, r, b])
//    }
//
//    func loadAlbums(with selectedModels: [YLAssetModel]) {
//        if albums.count == 0 && isOpen {
//            YLProgressHUD.showHUD(nil, inView: self)
//        } else if selectedModels.count > 0 && albums.count > 0 {
//            for albumModel in albums {
//                albumModel.selectedModels = selectedModels
//            }
//            reloadData()
//        }
//
//        DispatchQueue.global().async {
//            YLImageManager.shared.allAlbums(isFetchAssets: true, completion: { (models) in
//                for albumModel in models {
//                    albumModel.selectedModels = selectedModels
//                }
//                self.albums = models
//                DispatchQueue.main.async {
//                    YLProgressHUD.hide(false)
//                    self.reloadData()
//                }
//            })
//        }
//    }
//}
//
//extension YLAlbumListView: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return albums.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "YLAlbumListCell", for: indexPath) as! YLAlbumListCell
//        cell.bindData(with: albums[indexPath.row])
//        return cell
//    }
//}
