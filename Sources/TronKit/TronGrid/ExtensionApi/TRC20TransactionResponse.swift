//
//  TRC20TransactionResponse.swift
//
//  Created by Sun on 2023/5/2.
//

import Foundation

import BigInt
import ObjectMapper

// MARK: - TRC20TransactionResponse

struct TRC20TransactionResponse: ImmutableMappable {
    // MARK: Properties

    let transactionID: Data
    let tokenInfo: TokenInfo
    let blockTimestamp: Int
    let from: Address
    let to: Address
    let type: String
    let value: BigUInt

    // MARK: Lifecycle

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

// MARK: TRC20TransactionResponse.TokenInfo

extension TRC20TransactionResponse {
    struct TokenInfo: ImmutableMappable {
        // MARK: Properties

        let symbol: String
        let address: Address
        let decimals: Int
        let name: String

        // MARK: Lifecycle

        public init(map: Map) throws {
            symbol = try map.value("symbol")
            address = try map.value("address", using: StringAddressTransform())
            decimals = try map.value("decimals")
            name = try map.value("name")
        }
    }
}
