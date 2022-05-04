//
//  LiveTweetsApp.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import SwiftUI

@main
struct LiveTweetsApp: App {
    private let twitterViewModel: TwitterViewModel = {
        let twitter = TwitterAPI(session: .default)
        return TwitterViewModel(twitter: twitter)
    }()

    var body: some Scene {
        WindowGroup {
            TweetsListView(twitterViewModel: twitterViewModel)
        }
    }
}
