//
//  TwitterViewModel.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation

class TwitterViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    @Published var error: String?
    
    private var twitter: Twitter
    var isFetching = true
    
    init(twitter: Twitter) {
        self.twitter = twitter
    }
    
    func replaceRule(withText text: String) async {
        let updateRule = await twitter.updateRule(text: text)
        switch updateRule {
        case .success:
            getLiveData()
        case let .failure(error):
            self.failure(text: error.localizedDescription)
        }
    }
    
    func getLiveData() {
        twitter.requestLiveTweets { [weak self] result in
            self?.isFetching = false
            switch result {
            case let .success(tweet):
                self?.tweets.insert(tweet, at: 0)
                self?.error = nil
                
            case let .failure(error):
                self?.failure(text: error.localizedDescription)
            }
        }
    }
    
    private func failure(text: String) {
        tweets = []
        error = text
    }
}
