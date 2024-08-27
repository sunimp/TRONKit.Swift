//
//  Trc20TransactionResponse.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BigInt
import ObjectMapper

// MARK: - Trc20TransactionResponse

struct Trc20TransactionResponse: ImmutableMappable {
    let transactionID: Data
    let tokenInfo: TokenInfo
    let blockTimestamp: Int
    let from: Address
    let to: Address
    let type: String
    let value: BigUInt

    public init(map: Map) throws {
        transactionID = try map.value("transaction_id", using: HexDataTransform())
        tokenInfo = try map.value("token_info")
        blockTimestamp = try map.value("block_timestamp")
        from = try map.value("from", using: StringAddressTransform())
        to = try map.value("to", using: StringAddressTransform())
        type = try map.value("type")
        value = try map.value("value", using: StringBigUIntTransform())
    }
}

// MARK: Trc20TransactionResponse.TokenInfo

extension Trc20TransactionResponse {
    struct TokenInfo: ImmutableMappable {
        let symbol: String
        let address: Address
        let decimals: Int
        let name: String

        public init(map: Map) throws {
            symbol = try map.value("symbol")
            address = try map.value("address", using: StringAddressTransform())
            decimals = try map.value("decimals")
            name = try map.value("name")
        }
    }
}
