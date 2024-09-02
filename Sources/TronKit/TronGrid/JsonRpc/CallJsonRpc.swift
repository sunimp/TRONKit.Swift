//
//  CallJsonRpc.swift
//
//  Created by Sun on 2023/6/9.
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
