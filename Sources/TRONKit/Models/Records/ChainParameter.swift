//
//  ChainParameter.swift
//
//  Created by Sun on 2023/5/26.
//

import Foundation

import GRDB

class ChainParameter: Record {
    // MARK: Nested Types

    enum Columns: String, ColumnExpression, CaseIterable {
        case key
        case value
    }

    // MARK: Overridden Properties

    override public class var databaseTableName: String {
        "chain_parameters"
    }

    // MARK: Properties

    let key: String
    let value: Int?

    // MARK: Lifecycle

    init(key: String, value: Int?) {
        self.key = key
        self.value = value

        super.init()
    }

    required init(row: Row) throws {
        key = row[Columns.key]
        value = row[Columns.value]

        try super.init(row: row)
    }

    // MARK: Overridden Functions

    override public func encode(to container: inout PersistenceContainer) {
        container[Columns.key] = key
        container[Columns.value] = value
    }
}
