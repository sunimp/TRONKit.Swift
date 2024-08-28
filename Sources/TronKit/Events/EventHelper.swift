//
//  EventHelper.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

enum EventHelper {
    static func eventFromRecord(record: Trc20EventRecord) -> Event? {
        switch record.type {
        case "Transfer": Trc20TransferEvent(record: record)
        case "Approval": Trc20ApproveEvent(record: record)
        default: nil
        }
    }
}
