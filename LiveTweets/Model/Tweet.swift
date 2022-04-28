//
//  Tweet.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation

struct Tweet: Codable, Identifiable {
    
    let id: String
    let text: String
    
    enum RootKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
        let container = try rootContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        id = try container.decode(String.self, forKey: .id)
        text = try container.decode(String.self, forKey: .text)
    }
    
    init(id: String, text: String) {
        self.id = id
        self.text = text
    }
}
