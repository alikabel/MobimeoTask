//
//  GiphyTableViewModel.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 22.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import Foundation

class GiphyTableViewModel {
    private let networkClient: NetworkClient?
    private var giphyList: GiphyList?
    
    init(newtworkClient: NetworkClient) {
        self.networkClient = newtworkClient
    }
    
    var items: [Giphy] {
        return giphyList?.data ?? []
    }
    
    func getGiphyList(limit: Int, rating: String, success: (() -> Void)?, failure: ((Error) -> Void)?) {
        networkClient?.performNetworkingTask(endPoint: GiphyAPI.trending(limit: limit, rating: rating), type: GiphyList.self, success: { [weak self] list in
            self?.giphyList = list
            success?()
        }, failure: { error in
            failure?(error)
        })
    }
}
