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
        tableView?.delegate = self
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

// MARK:- UITableViewDelegate
extension GiphyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let giphyItem = giphyTableViewModel?.items[indexPath.row],
            let  url = giphyItem.images?.original?.url  else { return }
        let detailsViewModel = GiphyDetailsViewModel(urlString: url, userName: giphyItem.username ?? "", rating: giphyItem.rating ?? "")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsView = storyboard.instantiateViewController(withIdentifier: "GiphyDetailsViewController") as! GiphyDetailsViewController
        detailsView.detailsViewModel = detailsViewModel
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
