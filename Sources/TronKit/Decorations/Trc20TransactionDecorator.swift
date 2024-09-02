//
//  Trc20TransactionDecorator.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

import BigInt

// MARK: - Trc20TransactionDecorator

class Trc20TransactionDecorator {
    // MARK: Properties

    private let address: Address
    private let factories = ContractMethodFactories()

    // MARK: Lifecycle

    init(address: Address) {
        self.address = address
        factories.register(factories: [TransferMethodFactory(), ApproveMethodFactory()])
    }
}

// MARK: ITransactionDecorator

extension Trc20TransactionDecorator: ITransactionDecorator {
    func decoration(
        contract: TriggerSmartContract,
        internalTransactions _: [InternalTransaction],
        events: [Event]
    )
        -> TransactionDecoration? {
        guard let contractMethod = factories.createMethod(input: contract.data.ww.hexData!) else {
            return nil
        }

        if let transferMethod = contractMethod as? TransferMethod {
            if contract.ownerAddress == address {
                return OutgoingEip20Decoration(
                    contractAddress: contract.contractAddress,
                    to: transferMethod.to,
                    value: transferMethod.value,
                    sentToSelf: transferMethod.to == address,
                    tokenInfo: events.compactMap { $0 as? Trc20TransferEvent }
                        .first { $0.contractAddress == contract.contractAddress }?.tokenInfo
                )
            }
        }

        if let approveMethod = contractMethod as? ApproveMethod {
            return ApproveEip20Decoration(
                contractAddress: contract.contractAddress,
                spender: approveMethod.spender,
                value: approveMethod.value
            )
        }

        return nil
    }
}
