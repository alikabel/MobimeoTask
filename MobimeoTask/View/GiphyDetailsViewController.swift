//
//  GiphyDetailsViewController.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 22.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import UIKit
import SDWebImageFLPlugin

class GiphyDetailsViewController: UIViewController {
    @IBOutlet private weak var giphyImageView: FLAnimatedImageView?
    @IBOutlet private weak var ratingLabel: UILabel?
    @IBOutlet private weak var userNameLabel: UILabel?
    
    var detailsViewModel: GiphyDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let detailsViewModel = detailsViewModel else { return }
        if let userName = detailsViewModel.userName, userName != "" {
            userNameLabel?.text = String(format: "UserName: %@", userName.uppercased())
        }
        if let rating = detailsViewModel.rating {
            ratingLabel?.text = String(format: "Rating: %@", rating.uppercased())
        }
        detailsViewModel.setGiphyImageView(imageView: giphyImageView)
    }
}
