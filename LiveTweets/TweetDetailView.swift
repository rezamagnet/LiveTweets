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
            Text("Tweet id: \(tweet.id)")
                .font(.headline)
            Text(tweet.text)
                .font(.body)
            Spacer()
        }
        .navigationTitle("Detail")
        .padding()
    }
}
