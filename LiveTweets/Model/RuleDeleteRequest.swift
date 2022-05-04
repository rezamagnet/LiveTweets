//
//  RuleDeleteRequest.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/28/22.
//

import Foundation

struct RuleDeleteRequest: Codable {
    let delete: RuleDeleteIds
    struct RuleDeleteIds: Codable {
        let ids: [String]
    }
}
