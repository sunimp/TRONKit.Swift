//
//  UnknownTransactionDecoration.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

import BigInt

open class UnknownTransactionDecoration: TransactionDecoration {
    // MARK: Properties

    public let toAddress: Address?
    public let fromAddress: Address?
    public let data: Data?
    public let value: Int?
    public let tokenValue: Int?
    public let tokenID: Int?

    public let internalTransactions: [InternalTransaction]
    public let events: [Event]

    // MARK: Lifecycle

    init(contract: TriggerSmartContract?, internalTransactions: [InternalTransaction], events: [Event]) {
        fromAddress = contract?.ownerAddress
        toAddress = contract?.contractAddress
        data = contract?.data.ww.hexData
        value = contract?.callValue
        tokenValue = contract?.callTokenValue
        tokenID = contract?.tokenID
        self.internalTransactions = internalTransactions
        self.events = events
    }

    // MARK: Overridden Functions

    override public func tags(userAddress: Address) -> [TransactionTag] {
        Array(Set(
            tagsFromInternalTransactions(userAddress: userAddress) +
                tagsFromEventInstances(userAddress: userAddress)
        ))
    }

    // MARK: Functions

    private func tagsFromInternalTransactions(userAddress: Address) -> [TransactionTag] {
        let value = value ?? 0
        let incomingInternalTransactions = internalTransactions.filter { $0.to == userAddress }

        var outgoingValue = 0
        if fromAddress == userAddress {
            outgoingValue = value
        }
        var incomingValue = 0
        if toAddress == userAddress {
            incomingValue = value
        }
        for incomingInternalTransaction in incomingInternalTransactions {
            incomingValue += incomingInternalTransaction.value
        }

        // if has value or has internalTxs must add Evm tag
        if outgoingValue == 0, incomingValue == 0 {
            return []
        }

        var tags = [TransactionTag]()

        let addresses = [fromAddress, toAddress]
            .compactMap { $0 }
            .filter { $0 != userAddress }
            .map(\.hex)

        if incomingValue > outgoingValue {
            tags.append(TransactionTag(type: .incoming, protocol: .native, addresses: addresses))
        } else if outgoingValue > incomingValue {
            tags.append(TransactionTag(type: .outgoing, protocol: .native, addresses: addresses))
        }

        return tags
    }

    private func tagsFromEventInstances(userAddress: Address) -> [TransactionTag] {
        var tags = [TransactionTag]()

        for event in events {
            tags.append(contentsOf: event.tags(userAddress: userAddress))
        }

        return tags
    }
}
