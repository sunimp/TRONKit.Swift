//
//  TransactionDecoration.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

open class TransactionDecoration {
    // MARK: Lifecycle

    public init() { }

    // MARK: Functions

    open func tags(userAddress _: Address) -> [TransactionTag] {
        []
    }
}
