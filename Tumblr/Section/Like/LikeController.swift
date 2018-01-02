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
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: VideoCell.self)
        cell.model = viewModel.list[indexPath.row]
        return cell
    }
    
}

extension LikeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let post = viewModel.list[indexPath.row]
        
        return CGFloat(30 + 16 + ScreenWidth() * post.thumbnail_height / post.thumbnail_width)
    }
}
