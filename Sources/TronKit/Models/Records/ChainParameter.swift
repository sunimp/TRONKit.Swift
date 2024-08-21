//
//  ChainParameter.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import GRDB

class ChainParameter: Record {
    let key: String
    let value: Int?

    init(key: String, value: Int?) {
        self.key = key
        self.value = value

        super.init()
    }

    override public class var databaseTableName: String {
        "chain_parameters"
    }

    enum Columns: String, ColumnExpression, CaseIterable {
        case key
        case value
    }

    required init(row: Row) throws {
        key = row[Columns.key]
        value = row[Columns.value]

        try super.init(row: row)
    }

    override public func encode(to container: inout PersistenceContainer) {
        container[Columns.key] = key
        container[Columns.value] = value
    }
}
