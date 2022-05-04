//
//  TweetsListView.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import SwiftUI

struct TweetsListView: View {
    @ObservedObject var twitterViewModel: TwitterViewModel
    @State private var ruleText: String = ""
    var body: some View {
        NavigationView {
            List(twitterViewModel.tweets) { tweet in
                NavigationLink(destination: TweetDetailView(tweet: tweet)) {
                    Text(tweet.text)
                        .font(.body)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Tweets")
            .overlay {
                showNetworkState()
            }
        }
        .searchable(text: $ruleText, prompt: "Keyword Search")
        .onSubmit(of: .search, {
            Task {
                await twitterViewModel.replaceRule(withText: ruleText)
            }
        })
        .onAppear {
            twitterViewModel.getLiveData()
        }
    }
    @ViewBuilder private func showNetworkState() -> some View {
        if let error = twitterViewModel.error {
            Text(error)
        } else if twitterViewModel.isFetching {
            ProgressView()
        } else {
            // Show list items
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let twitter = TwitterAPI(session: .default)
        let twitterModel = TwitterViewModel(twitter: twitter)
        TweetsListView(twitterViewModel: twitterModel)
    }
}
