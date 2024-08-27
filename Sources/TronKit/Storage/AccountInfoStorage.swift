//
//  AccountInfoStorage.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BigInt
import GRDB

// MARK: - AccountInfoStorage

class AccountInfoStorage {
    private let dbPool: DatabasePool

    init(databaseDirectoryUrl: URL, databaseFileName: String) {
        let databaseUrl = databaseDirectoryUrl.appendingPathComponent("\(databaseFileName).sqlite")

        dbPool = try! DatabasePool(path: databaseUrl.path)

        try! migrator.migrate(dbPool)
    }

    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        migrator.registerMigration("createBalances") { db in
            try db.create(table: Balance.databaseTableName, body: { t in
                t.column(Balance.Columns.id.name, .text).notNull().primaryKey(onConflict: .replace)
                t.column(Balance.Columns.balance.name, .text).notNull()
            })
        }

        return migrator
    }

    private var trxID = "TRX"
    private func trc10ID(name: String) -> String { "trc10/\(name)" }
    private func trc20ID(contractAddress: String) -> String { "trc20/\(contractAddress)" }
}

extension AccountInfoStorage {
    var trxBalance: BigUInt? {
        try! dbPool.read { db in
            try Balance.filter(Balance.Columns.id == trxID).fetchOne(db)?.balance
        }
    }

    func trc20Balance(address: String) -> BigUInt? {
        try! dbPool.read { db in
            try Balance.filter(Balance.Columns.id == trc20ID(contractAddress: address)).fetchOne(db)?.balance
        }
    }

    func save(trxBalance: BigUInt) {
        _ = try! dbPool.write { db in
            let balance = Balance(id: trxID, balance: trxBalance)
            try balance.insert(db)
        }
    }

    func save(trc20Balance: BigUInt, address: String) {
        _ = try! dbPool.write { db in
            let balance = Balance(id: trc20ID(contractAddress: address), balance: trc20Balance)
            try balance.insert(db)
        }
    }

    func clearTrc20Balances() {
        _ = try! dbPool.write { db in
            try Balance.filter(Balance.Columns.id != trxID).deleteAll(db)
        }
    }
}
