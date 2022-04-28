//
//  RuleAddRequest.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/28/22.
//

import Foundation

struct RuleAddRequest: Codable {
    let add: [RuleValue]
    
    struct RuleValue: Codable {
        let value: String
    }
}
