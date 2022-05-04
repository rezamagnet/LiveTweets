//
//  Twitter.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/28/22.
//

import Foundation

protocol Twitter {
    func requestLiveTweets(completion: @escaping (Result<Tweet, Error>) -> Void)
    func updateRule(text: String) async -> Result<Ignorable, Error>
}
