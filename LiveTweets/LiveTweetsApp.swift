//
//  LiveTweetsApp.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import SwiftUI
import Alamofire

@main
struct LiveTweetsApp: App {
    
    
    private let twitterViewModel: TwitterViewModel = {
        let logger = Logger()
        let session = Session(eventMonitors: [logger])
        let twitter = TwitterAPI(session: session)
        return TwitterViewModel(twitter: twitter)
    }()

    var body: some Scene {
        WindowGroup {
            TweetsListView(twitterViewModel: twitterViewModel)
        }
    }
}

final class Logger: EventMonitor {
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint(response)
    }
}
