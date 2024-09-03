//
//  ChainParameterResponse.swift
//
//  Created by Sun on 2023/5/26.
//

import Foundation

import ObjectMapper

struct ChainParameterResponse: ImmutableMappable {
    // MARK: Properties

    let key: String
    let value: Int?

    // MARK: Lifecycle

    public init(map: Map) throws {
        key = try map.value("key")
        value = try map.value("value")
    }
}
