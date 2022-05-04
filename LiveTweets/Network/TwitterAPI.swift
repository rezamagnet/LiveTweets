//
//  TwitterAPI.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation
import Alamofire
import Combine

class TwitterAPI: Twitter {
    var requestsCancellable: Set<AnyCancellable> = []
    var session: Session
    init(session: Session) {
        self.session = session
    }
    struct ErrorModel: LocalizedError {
        var errorDescription: String?
    }
}
