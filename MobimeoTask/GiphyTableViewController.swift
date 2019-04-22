//
//  GiphyTableViewController.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 21.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import UIKit
import SDWebImageFLPlugin

class GiphyTableViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView?
    
    private let networkClient = NetworkClient()
    private var giphyTableViewModel: GiphyTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        giphyTableViewModel = GiphyTableViewModel(newtworkClient: networkClient)
        giphyTableViewModel?.getGiphyList(limit: 25, rating: "G", success: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
            }
        }, failure: { error in
            
        })
    }
}

// MARK:- UITableViewDataSource
extension GiphyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return giphyTableViewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GiphyTableViewCell") as? GiphyTableViewCell,
            let originalImage = giphyTableViewModel?.items[indexPath.row].images?.original else { return  UITableViewCell() }
        let cellViewModel = GiphyTableCellViewModel(originalImage: originalImage)
        cell.viewModel = cellViewModel
        return cell
    }
    
    
}
