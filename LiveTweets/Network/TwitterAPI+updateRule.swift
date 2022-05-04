//
//  TwitterAPI+updateRule.swift
//  LiveTweets
//
//  Created by Reza Khonsari on 4/27/22.
//

import Foundation

extension TwitterAPI {
    private func retrieveRules() async -> Result<RuleResponse, Error> {
        do {
            return .success(
                try await session.request(Router.getRetrieveRules).serializingDecodable(RuleResponse.self).value
            )
        } catch {
            return .failure(error)
        }
    }
    private func deleteRules() async -> Result<Ignorable, Error> {
        session.cancelAllRequests()
        let result = await retrieveRules()
        switch result {
        case let .success(rules):
            let ids = rules.data?.map { $0.id } ?? []
            let ruleDelete = RuleDeleteRequest(delete: RuleDeleteRequest.RuleDeleteIds(ids: ids))
            do {
                return .success(
                    try await session.request(Router.deleteRules(ruleDelete)).serializingDecodable(Ignorable.self).value
                )
            } catch {
                return .failure(error)
            }
        case let .failure(error):
            return .failure(error)
        }
    }
    func updateRule(text: String) async -> Result<Ignorable, Error> {
        let data = await deleteRules()
        switch data {
        case .success:
            let addRule = RuleAddRequest(add: [RuleAddRequest.RuleValue(value: text)])
            do {
                requestsCancellable.removeAll()
                session.cancelAllRequests()
                return .success(
                    try await session.request(Router.addRule(addRule)).serializingDecodable(Ignorable.self).value
                )
            } catch {
                return .failure(error)
            }
        case let .failure(error):
            return .failure(error)
        }
    }
}
