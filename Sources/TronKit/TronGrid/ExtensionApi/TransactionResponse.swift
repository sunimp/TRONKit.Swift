//
//  TransactionResponse.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import ObjectMapper

// MARK: - ITransactionResponse

protocol ITransactionResponse {
    var blockTimestamp: Int { get }
}

// MARK: - TransactionResponse

struct TransactionResponse: ImmutableMappable, ITransactionResponse {
    let ret: [Ret]
    let signature: [String]
    let txID: Data
    let netUsage: Int
    let netFee: Int
    let energyUsage: Int
    let blockNumber: Int
    let blockTimestamp: Int
    let energyFee: Int
    let energyUsageTotal: Int
    let rawData: RawData

    public init(map: Map) throws {
        ret = try map.value("ret")
        signature = try map.value("signature")
        txID = try map.value("txID", using: HexDataTransform())
        netUsage = try map.value("net_usage")
        netFee = try map.value("net_fee")
        energyUsage = try map.value("energy_usage")
        blockNumber = try map.value("blockNumber")
        blockTimestamp = try map.value("block_timestamp")
        energyFee = try map.value("energy_fee")
        energyUsageTotal = try map.value("energy_usage_total")
        rawData = try map.value("raw_data")
    }

    struct Ret: ImmutableMappable {
        let contractRet: String
        let fee: Int

        public init(map: Map) throws {
            contractRet = try map.value("contractRet")
            fee = try map.value("fee")
        }
    }

    struct RawData: ImmutableMappable {
        let contract: Any?
        let refBlockBytes: String
        let refBlockHash: String
        let expiration: Int
        let feeLimit: Int?
        let timestamp: Int

        public init(map: Map) throws {
            contract = map["contract"].currentValue
            refBlockBytes = try map.value("ref_block_bytes")
            refBlockHash = try map.value("ref_block_hash")
            expiration = try map.value("expiration")
            feeLimit = try map.value("fee_limit")
            timestamp = try map.value("timestamp")
        }
    }
}

// MARK: - InternalTransactionResponse

struct InternalTransactionResponse: ImmutableMappable, ITransactionResponse {
    let internalTxID: String
    let txID: Data
    let data: InternalTxData
    let blockTimestamp: Int
    let toAddress: Address
    let fromAddress: Address

    init(map: ObjectMapper.Map) throws {
        internalTxID = try map.value("internal_tx_id")
        txID = try map.value("tx_id", using: HexDataTransform())
        data = try map.value("data")
        blockTimestamp = try map.value("block_timestamp")
        toAddress = try map.value("to_address", using: HexAddressTransform())
        fromAddress = try map.value("from_address", using: HexAddressTransform())
    }

    struct InternalTxData: ImmutableMappable {
        let note: String
        let rejected: Bool
        let value: Int

        init(map: ObjectMapper.Map) throws {
            note = try map.value("note")
            rejected = try map.value("rejected")
            value = try map.value("call_value._")
        }
    }
}
