//
//  TransactionDecoration.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

open class TransactionDecoration {
    public init() {}

    open func tags(userAddress _: Address) -> [TransactionTag] {
        []
    }
}
