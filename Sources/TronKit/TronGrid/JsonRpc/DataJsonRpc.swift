//
//  DataJsonRpc.swift
//
//  Created by Sun on 2023/6/9.
//

import Foundation

class DataJsonRpc: JsonRpc<Data> {
    override func parse(result: Any) throws -> Data {
        guard let hexString = result as? String, let value = hexString.ww.hexData else {
            throw JsonRpcResponse.ResponseError.invalidResult(value: result)
        }

        return value
    }
}
