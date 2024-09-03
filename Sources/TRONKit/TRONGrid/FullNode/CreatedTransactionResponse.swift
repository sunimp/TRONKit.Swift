//
//  CreatedTransactionResponse.swift
//
//  Created by Sun on 2023/5/26.
//

import Foundation

import ObjectMapper

struct CreatedTransactionResponse: ImmutableMappable {
    // MARK: Properties

    let txID: Data
    let rawData: TransactionResponse.RawData
    let rawDataHex: Data

    // MARK: Lifecycle

    public init(map: Map) throws {
        txID = try map.value("txID", using: HexDataTransform())
        rawData = try map.value("raw_data")
        rawDataHex = try map.value("raw_data_hex", using: HexDataTransform())
    }
}
