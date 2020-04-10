//
//  File.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 10/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import Foundation

struct Throwable<T: Decodable>: Decodable {
    let result: Result<T, Error>

    init(from decoder: Decoder) throws {
        result = Result(catching: { try T(from: decoder) })
    }
}
