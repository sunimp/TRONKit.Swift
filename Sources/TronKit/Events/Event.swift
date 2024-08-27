//
//  Event.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

// MARK: - Event

open class Event {
    public let transactionHash: Data
    public let contractAddress: Address

    public init(transactionHash: Data, contractAddress: Address) {
        self.transactionHash = transactionHash
        self.contractAddress = contractAddress
    }

    open func tags(userAddress _: Address) -> [TransactionTag] {
        []
    }
}

// MARK: - TokenInfo

public struct TokenInfo {
    public let tokenName: String
    public let tokenSymbol: String
    public let tokenDecimal: Int
}
