//
//  TransactionRecord.swift
//  TronKit-Demo
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import TronKit

struct TransactionRecord {
    let transactionHash: String
    let transactionHashData: Data
    let timestamp: Int
    let isFailed: Bool

    let blockHeight: Int?

    let decoration: TransactionDecoration
}
