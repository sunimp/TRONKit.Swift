//
//  TransactionResponse.swift
//
//  Created by Sun on 2023/5/2.
//

import Foundation

import ObjectMapper

// MARK: - ITransactionResponse

protocol ITransactionResponse {
    var blockTimestamp: Int { get }
}

// MARK: - TransactionResponse

struct TransactionResponse: ImmutableMappable, ITransactionResponse {
    // MARK: Nested Types

    struct Ret: ImmutableMappable {
        // MARK: Properties

        let contractRet: String
        let fee: Int

        // MARK: Lifecycle

        public init(map: Map) throws {
            contractRet = try map.value("contractRet")
            fee = try map.value("fee")
        }
    }

    struct RawData: ImmutableMappable {
        // MARK: Properties

        let contract: Any?
        let refBlockBytes: String
        let refBlockHash: String
        let expiration: Int
        let feeLimit: Int?
        let timestamp: Int

        // MARK: Lifecycle

        public init(map: Map) throws {
            contract = map["contract"].currentValue
            refBlockBytes = try map.value("ref_block_bytes")
            refBlockHash = try map.value("ref_block_hash")
            expiration = try map.value("expiration")
            feeLimit = try map.value("fee_limit")
            timestamp = try map.value("timestamp")
        }
    }

    // MARK: Properties

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

    // MARK: Lifecycle

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
}

// MARK: - InternalTransactionResponse

struct InternalTransactionResponse: ImmutableMappable, ITransactionResponse {
    // MARK: Nested Types

    struct InternalTxData: ImmutableMappable {
        // MARK: Properties

        let note: String
        let rejected: Bool
        let value: Int

        // MARK: Lifecycle

        init(map: ObjectMapper.Map) throws {
            note = try map.value("note")
            rejected = try map.value("rejected")
            value = try map.value("call_value._")
        }
    }

    // MARK: Properties

    let internalTxID: String
    let txID: Data
    let data: InternalTxData
    let blockTimestamp: Int
    let toAddress: Address
    let fromAddress: Address

    // MARK: Lifecycle

    init(map: ObjectMapper.Map) throws {
        internalTxID = try map.value("internal_tx_id")
        txID = try map.value("tx_id", using: HexDataTransform())
        data = try map.value("data")
        blockTimestamp = try map.value("block_timestamp")
        toAddress = try map.value("to_address", using: HexAddressTransform())
        fromAddress = try map.value("from_address", using: HexAddressTransform())
    }
}
