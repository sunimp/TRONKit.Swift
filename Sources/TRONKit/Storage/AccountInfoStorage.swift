//
//  AccountInfoStorage.swift
//
//  Created by Sun on 2023/5/2.
//

import Foundation

import BigInt
import GRDB

// MARK: - AccountInfoStorage

class AccountInfoStorage {
    // MARK: Properties

    private let dbPool: DatabasePool

    private var trxID = "TRX"

    // MARK: Computed Properties

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

    // MARK: Lifecycle

    init(databaseDirectoryURL: URL, databaseFileName: String) {
        let databaseURL = databaseDirectoryURL.appendingPathComponent("\(databaseFileName).sqlite")

        dbPool = try! DatabasePool(path: databaseURL.path)

        try! migrator.migrate(dbPool)
    }

    // MARK: Functions

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
