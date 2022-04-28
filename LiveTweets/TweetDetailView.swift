//
//  TweetDetailView.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import SwiftUI

struct TweetDetailView: View {
    
    var tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            let tweetId = String(format: "Tweet id: %@".localized(), tweet.id)
            Text(tweetId)
                .font(.headline)
            Text(tweet.text)
                .font(.body)
            Spacer()
        }
        .navigationTitle("Detail".localized())
        .padding()
    }
}
