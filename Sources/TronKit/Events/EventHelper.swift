//
//  EventHelper.swift
//
//  Created by Sun on 2023/5/17.
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
