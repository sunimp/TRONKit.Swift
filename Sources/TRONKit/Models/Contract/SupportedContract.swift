//
//  SupportedContract.swift
//
//  Created by Sun on 2023/5/26.
//

import Foundation

import SwiftProtobuf

// MARK: - SupportedContract

protocol SupportedContract: Contract {
    var protoMessage: SwiftProtobuf.Message { get }
    var protoContractType: Protocol_Transaction.Contract.ContractType { get }
}

// MARK: - TransferContract + SupportedContract

extension TransferContract: SupportedContract {
    var protoMessage: Message {
        var message = Protocol_TransferContract()
        message.ownerAddress = ownerAddress.raw
        message.toAddress = toAddress.raw
        message.amount = Int64(amount)

        return message
    }

    var protoContractType: Protocol_Transaction.Contract.ContractType {
        .transferContract
    }
}

// MARK: - TriggerSmartContract + SupportedContract

extension TriggerSmartContract: SupportedContract {
    var protoMessage: Message {
        var message = Protocol_TriggerSmartContract()
        message.ownerAddress = ownerAddress.raw
        message.contractAddress = contractAddress.raw
        message.data = data.ww.hexData!
        message.callValue = Int64(callValue ?? 0)
        message.callTokenValue = Int64(callTokenValue ?? 0)
        message.tokenID = Int64(tokenID ?? 0)

        return message
    }

    var protoContractType: Protocol_Transaction.Contract.ContractType {
        .triggerSmartContract
    }
}
