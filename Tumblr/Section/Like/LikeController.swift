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
        
        tableView.sunny.config {
            $0.separatorStyle = .none
            $0.tableFooterView = UIView()
            $0.backgroundColor = Const.Color.black
            $0.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        }
        viewModel.load { [weak self] in
            self?.tableView.reloadData()
        }
    }

}

extension LikeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.list[indexPath.section]
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
        case .audio:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: VideoCell.self)
            cell.model = model
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView().sunny.config({
            $0.backgroundColor = Const.Color.black
        })
    }
}

extension LikeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = viewModel.list[indexPath.section]
        return model.cellHeight()
    }
}
