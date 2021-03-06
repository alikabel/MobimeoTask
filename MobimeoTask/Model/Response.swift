//
//  Response.swift
//  MobimeoTask
//
//  Created by Ali Kabel on 21.04.19.
//  Copyright © 2019 Ali Kabel. All rights reserved.
//

import Foundation

struct Response {
    private var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch let error {
            print(error)
            return nil
        }
    }
}
