//
//  Transaction.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BigInt
import GRDB

public class Transaction: Record {
    public let hash: Data
    public let timestamp: Int
    public var isFailed: Bool
    public let blockNumber: Int?
    public let confirmed: Bool
    public let processed: Bool

    public let fee: Int?
    public let netUsage: Int?
    public let netFee: Int?
    public let energyUsage: Int?
    public let energyFee: Int?
    public let energyUsageTotal: Int?

    public let contractsRaw: Data?

    public lazy var contract: Contract? = {
        guard let data = contractsRaw else {
            return nil
        }

        let contracts = try? ContractHelper.contractsFrom(data: data)
        return contracts?.first
    }()

    public func ownTransaction(ownAddress: Address) -> Bool {
        contract.flatMap { $0.ownTransaction(ownAddress: ownAddress) } ?? false
    }

    public init(
        hash: Data,
        timestamp: Int,
        isFailed: Bool,
        blockNumber: Int? = nil,
        confirmed: Bool,
        fee: Int? = nil,
        netUsage: Int? = nil,
        netFee: Int? = nil,
        energyUsage: Int? = nil,
        energyFee: Int? = nil,
        energyUsageTotal: Int? = nil,
        contractsMap: Any? = nil
    ) {
        self.hash = hash
        self.timestamp = timestamp
        self.isFailed = isFailed
        self.blockNumber = blockNumber
        self.confirmed = confirmed
        processed = false

        self.fee = fee
        self.netUsage = netUsage
        self.netFee = netFee
        self.energyUsage = energyUsage
        self.energyFee = energyFee
        self.energyUsageTotal = energyUsageTotal

        contractsRaw = contractsMap.flatMap { try? JSONSerialization.data(withJSONObject: $0) }

        super.init()

        if let contractsMap {
            let contracts = try? ContractHelper.contractsFrom(jsonMap: contractsMap)
            contract = contracts?.first
        }
    }

    override public class var databaseTableName: String {
        "transactions"
    }

    enum Columns: String, ColumnExpression {
        case hash
        case timestamp
        case isFailed
        case blockNumber
        case confirmed
        case processed
        case fee
        case netUsage
        case netFee
        case energyUsage
        case energyFee
        case energyUsageTotal
        case contractsRaw
    }

    required init(row: Row) throws {
        hash = row[Columns.hash]
        timestamp = row[Columns.timestamp]
        isFailed = row[Columns.isFailed]
        blockNumber = row[Columns.blockNumber]
        confirmed = row[Columns.confirmed]
        processed = row[Columns.processed]
        fee = row[Columns.fee]
        netUsage = row[Columns.netUsage]
        netFee = row[Columns.netFee]
        energyUsage = row[Columns.energyUsage]
        energyFee = row[Columns.energyFee]
        energyUsageTotal = row[Columns.energyUsageTotal]
        contractsRaw = row[Columns.contractsRaw]

        try super.init(row: row)
    }

    override public func encode(to container: inout PersistenceContainer) {
        container[Columns.hash] = hash
        container[Columns.timestamp] = timestamp
        container[Columns.isFailed] = isFailed
        container[Columns.blockNumber] = blockNumber
        container[Columns.confirmed] = confirmed
        container[Columns.processed] = processed
        container[Columns.fee] = fee
        container[Columns.netUsage] = netUsage
        container[Columns.netFee] = netFee
        container[Columns.energyUsage] = energyUsage
        container[Columns.energyFee] = energyFee
        container[Columns.energyUsageTotal] = energyUsageTotal
        container[Columns.contractsRaw] = contractsRaw
    }
}
