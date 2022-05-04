//
//  TwitterAPI+requestLiveTweets.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation

extension TwitterAPI {
    func requestLiveTweets(completion: @escaping (Result<Tweet, Error>) -> Void) {
        session.streamRequest(Router.stream)
            .publishDecodable(type: Tweet.self)
            .throttle(
                for: .seconds(Config.duration),
                scheduler: DispatchQueue.main,
                latest: true
            ).sink { response in
            switch response.result {
            case let .success(tweet):
                completion(.success(tweet))
            case let .failure(error):
                completion(.failure(
                    ErrorModel(
                        errorDescription: error.errorDescription
                    )
                ))
            case .none:
                completion(.failure(
                    ErrorModel(
                        errorDescription: "Empty Response"
                    )
                ))
            }
        }.store(in: &requestsCancellable)
    }
}
