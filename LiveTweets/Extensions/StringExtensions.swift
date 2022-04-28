//
//  StringExtensions.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
