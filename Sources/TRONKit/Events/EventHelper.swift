//
//  EventHelper.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

enum EventHelper {
    static func eventFromRecord(record: TRC20EventRecord) -> Event? {
        switch record.type {
        case "Transfer": TRC20TransferEvent(record: record)
        case "Approval": TRC20ApproveEvent(record: record)
        default: nil
        }
    }
}
