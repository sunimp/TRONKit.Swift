//
//  ContractMethod.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

open class ContractMethod {
    public init() { }

    open var methodSignature: String {
        fatalError("Subclasses must override.")
    }

    open var arguments: [Any] {
        fatalError("Subclasses must override.")
    }

    public var methodID: Data {
        ContractMethodHelper.methodID(signature: methodSignature)
    }

    public func encodedABI() -> Data {
        ContractMethodHelper.encodedABI(methodID: methodID, arguments: arguments)
    }
}
