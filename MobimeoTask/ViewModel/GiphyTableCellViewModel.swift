//
//  GiphyTableCellViewModel.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 22.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import UIKit
import SDWebImageFLPlugin

class GiphyTableCellViewModel {
    private(set) var originalImage: OriginalGIF?
    
    init(originalImage: OriginalGIF) {
        self.originalImage = originalImage
    }
        
    func getGiphyImageView(imageView: FLAnimatedImageView?) {
        imageView?.sd_setImage(with: URL(string:originalImage?.url ?? ""))
    }
}
