//
//  VideoMediaItem.swift
//  WordCamps
//
//  Created by Cesar Tardaguila on 14/4/2020.
//  Copyright © 2020 automattic. All rights reserved.
//

import Foundation

struct VideoItems {
    let videoItems: VideoItem
}

extension VideoItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case mp4 = "mp4"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let item = try container.decode(VideoItem.self, forKey: .mp4)
        
        self.init(videoItems: item)
    }
}


enum Quality: String, CodingKey {
    case low
    case medium = "med"
    case high
}

struct VideoItem {
    let lowURL: String
    let mediumURL: String
    let highURL: String
}

extension VideoItem: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Quality.self)
        
        let low = try container.decode(String.self, forKey: .low)
        let medium = try container.decode(String.self, forKey: .medium)
        let high = try container.decode(String.self, forKey: .high)
        
        
        self.init(lowURL: low, mediumURL: medium, highURL: high)
    }
}
