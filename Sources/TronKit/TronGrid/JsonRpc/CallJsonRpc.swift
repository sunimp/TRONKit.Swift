//
//  CallJsonRpc.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

class CallJsonRpc: DataJsonRpc {
    init(contractAddress: Address, data: Data) {
        super.init(
            method: "eth_call",
            params: [
                ["to": contractAddress.nonPrefixed.ww.hexString, "data": data.ww.hexString],
                "latest",
            ]
        )
    }
}
