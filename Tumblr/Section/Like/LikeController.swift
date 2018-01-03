//
//  LikeController.swift
//  Tumblr
//
//  Created by sunny on 2018/1/2.
//  Copyright © 2018年 CepheusSun. All rights reserved.
//

import UIKit

class LikeController: UIViewController {

    let viewModel = LikeViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "喜欢"
        tableView.register(cellType: VideoCell.self)
        tableView.register(cellType: PhotoSetCell.self)
        tableView.tableFooterView = UIView()
        viewModel.load { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension LikeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.list[indexPath.row]
        switch model.type {
        case .photo:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: PhotoSetCell.self)
            cell.model = model
            return cell
        case .video:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: VideoCell.self)
            cell.model = model
            return cell
        case .text:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: VideoCell.self)
            cell.model = model
            return cell
        }
    }
    
}

extension LikeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = viewModel.list[indexPath.row]
        
        switch model.type {
        case .photo:
            return CGFloat(30 + 100)
        case .video:
            return CGFloat(30 + 16 + ScreenWidth() * model.thumbnail_height.or(0) / model.thumbnail_width.or(1))
        case .text:
            return CGFloat(30 + 16 + ScreenWidth() * model.thumbnail_height.or(0) / model.thumbnail_width.or(1))
        }
        
    }
}
