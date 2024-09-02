//
//  Trc20TransferEvent.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

import BigInt

public class Trc20TransferEvent: Event {
    // MARK: Properties

    public let from: Address
    public let to: Address
    public let value: BigUInt

    public let tokenInfo: TokenInfo?

    // MARK: Lifecycle

    init(record: Trc20EventRecord) {
        from = record.from
        to = record.to
        value = record.value
        tokenInfo = TokenInfo(
            tokenName: record.tokenName,
            tokenSymbol: record.tokenSymbol,
            tokenDecimal: record.tokenDecimal
        )

        super.init(transactionHash: record.transactionHash, contractAddress: record.contractAddress)
    }

    // MARK: Overridden Functions

    override public func tags(userAddress: Address) -> [TransactionTag] {
        var tags = [TransactionTag]()

        if from == userAddress {
            tags.append(TransactionTag(
                type: .outgoing,
                protocol: .eip20,
                contractAddress: contractAddress,
                addresses: [to.hex]
            ))
        }

        if to == userAddress {
            tags.append(TransactionTag(
                type: .incoming,
                protocol: .eip20,
                contractAddress: contractAddress,
                addresses: [from.hex]
            ))
        }

        return tags
    }
}
