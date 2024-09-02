//
//  Event.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

// MARK: - Event

open class Event {
    // MARK: Properties

    public let transactionHash: Data
    public let contractAddress: Address

    // MARK: Lifecycle

    public init(transactionHash: Data, contractAddress: Address) {
        self.transactionHash = transactionHash
        self.contractAddress = contractAddress
    }

    // MARK: Functions

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
