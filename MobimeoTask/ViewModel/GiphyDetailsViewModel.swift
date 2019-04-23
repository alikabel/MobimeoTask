//
//  GiphyDetailsViewModel.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 22.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import Foundation
import SDWebImageFLPlugin

class GiphyDetailsViewModel {
    let urlString: String?
    let userName: String?
    let rating: String?
    
    init(urlString: String, userName: String, rating: String) {
        self.urlString = urlString
        self.userName = userName
        self.rating = rating
    }
    
    func setGiphyImageView(imageView: FLAnimatedImageView?) {
        imageView?.sd_setImage(with: URL(string:urlString ?? ""))
    }
}
