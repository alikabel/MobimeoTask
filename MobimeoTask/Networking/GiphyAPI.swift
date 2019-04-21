//
//  GiphyAPI.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 21.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import Foundation

enum GiphyAPI {
    case trending(limit: Int, rating: String)
}

extension GiphyAPI: EndpointType {
    var baseURL: URL? {
        return URL(string: Constants.baseURL)
    }
    
    var path: String {
        switch self {
        case .trending(let limit, let rating):
            return "/trending?api_key=\(Constants.apiKey)&limit=\(limit)&rating=\(rating)"
        }
    }
}
