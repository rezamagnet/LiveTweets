//
//  RuleResponse.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/28/22.
//

import Foundation

struct RuleResponse: Codable {
    var data: [RuleData]?
    struct RuleData: Codable {
        let id: String
    }
}
