//
//  LastBlockHeight.swift
//
//  Created by Sun on 2023/5/2.
//

import Foundation

import GRDB

class LastBlockHeight: Record {
    // MARK: Nested Types

    enum Columns: String, ColumnExpression {
        case primaryKey
        case height
    }

    // MARK: Static Properties

    private static let primaryKey = "primaryKey"

    // MARK: Overridden Properties

    override class var databaseTableName: String {
        "last_block_height"
    }

    // MARK: Properties

    var height: Int?

    private let primaryKey: String = LastBlockHeight.primaryKey

    // MARK: Lifecycle

    override init() {
        super.init()
    }

    required init(row: Row) throws {
        height = row[Columns.height]

        try super.init(row: row)
    }

    // MARK: Overridden Functions

    override func encode(to container: inout PersistenceContainer) {
        container[Columns.primaryKey] = primaryKey
        container[Columns.height] = height
    }
}
