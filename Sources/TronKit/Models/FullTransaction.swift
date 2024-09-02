//
//  FullTransaction.swift
//
//  Created by Sun on 2023/4/26.
//

import Foundation

public class FullTransaction {
    // MARK: Properties

    public let transaction: Transaction
    public let decoration: TransactionDecoration

    // MARK: Lifecycle

    init(transaction: Transaction, decoration: TransactionDecoration) {
        self.transaction = transaction
        self.decoration = decoration
    }
}
