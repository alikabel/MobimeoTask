//
//  GiphyTableViewCell.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 22.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import UIKit
import FLAnimatedImage
import SDWebImageFLPlugin

class GiphyTableViewCell: UITableViewCell {
    @IBOutlet weak var giphyImageView: FLAnimatedImageView?
    var viewModel: GiphyTableCellViewModel? {
        didSet {
            guard let cellViewModel = viewModel else { return }
            cellViewModel.getGiphyImageView(imageView: self.giphyImageView)
        }
    }
}
