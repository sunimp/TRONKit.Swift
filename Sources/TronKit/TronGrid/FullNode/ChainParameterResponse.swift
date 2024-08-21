//
//  ChainParameterResponse.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import ObjectMapper

struct ChainParameterResponse: ImmutableMappable {
    let key: String
    let value: Int?

    public init(map: Map) throws {
        key = try map.value("key")
        value = try map.value("value")
    }
}
