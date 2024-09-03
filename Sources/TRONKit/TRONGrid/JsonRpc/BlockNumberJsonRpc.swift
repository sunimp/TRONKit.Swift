//
//  BlockNumberJsonRpc.swift
//
//  Created by Sun on 2023/5/2.
//

import Foundation

class BlockNumberJsonRpc: IntJsonRpc {
    init() {
        super.init(method: "eth_blockNumber")
    }
}
