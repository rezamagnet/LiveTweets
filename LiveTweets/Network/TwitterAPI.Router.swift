//
//  TwitterAPI.Router.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation
import Alamofire

extension TwitterAPI {
    enum Router: URLRequestConvertible {
        case stream
        case getRetrieveRules
        case deleteRules(RuleDeleteRequest)
        case addRule(RuleAddRequest)
        var baseURL: URL {
            return URL(string: "https://api.twitter.com")!
        }
        var method: HTTPMethod {
            switch self {
            case .stream: return .get
            case .getRetrieveRules: return .get
            case .deleteRules, .addRule: return .post
            }
        }
        var path: String {
            switch self {
            case .stream: return "/2/tweets/search/stream"
            case .getRetrieveRules, .deleteRules, .addRule: return "/2/tweets/search/stream/rules"
            }
        }
        func asURLRequest() throws -> URLRequest {
            let url = baseURL.appendingPathComponent(path)
            var request = URLRequest(url: url)
            request.method = method
            request.addValue("Bearer \(Config.token)", forHTTPHeaderField: "Authorization")
            switch self {
            case .stream, .getRetrieveRules:
                return request
            case let .deleteRules(data):
                request = try JSONParameterEncoder.default.encode(data, into: request)
                return request
            case let .addRule(data):
                request = try JSONParameterEncoder.default.encode(data, into: request)
                return request
            }
        }
    }
    struct Config {
#if DEBUG
        static let token: String = "AAAAAAAAAAAAAAAAAAAAAK%2BeUgEAAAAAcBPofcvampMachJq8uDh%2F2DrXsA%3DSOlOZ1jP9FAeqCvoqx6Mqc9B87r0OgjZPpOsYJexFzJpUQEfLw"
#endif
        static let duration: Double = 1
    }
}
