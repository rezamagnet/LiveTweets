//
//  LiveTweetsTests.swift
//  LiveTweetsTests
//
//  Created by Reza Khonsari on 4/27/22.
//

import XCTest
import Alamofire
import Combine
@testable import LiveTweets

class LiveTweetsTests: XCTestCase {
    
    let twitterAPI: TwitterAPI = {
        let session = Session(configuration: .default)
        return TwitterAPI(session: session)
    }()
    
    func testTweetStream() {
        let exp = expectation(description: "Get tweets stream")
        
        twitterAPI.requestLiveTweets { response in
            switch response {
            case .success:
                exp.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [exp], timeout: 10)
    }
}
