//
//  market_contract.pb.swift
//
//  Created by Sun on 2023/5/26.
//

// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: core/contract/market_contract.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// MARK: - _GeneratedWithProtocGenSwiftVersion

/// If the compiler emits an error on this type, it is because this file
/// was generated by a version of the `protoc` Swift plug-in that is
/// incompatible with the version of SwiftProtobuf to which you are linking.
/// Please ensure that you are building against the same version of the API
/// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 { }
    typealias Version = _2
}

// MARK: - Protocol_MarketSellAssetContract

struct Protocol_MarketSellAssetContract {
    // MARK: Properties

    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ownerAddress: Data = .init()

    var sellTokenID: Data = .init()

    var sellTokenQuantity: Int64 = 0

    var buyTokenID: Data = .init()

    /// min to receive
    var buyTokenQuantity: Int64 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    // MARK: Lifecycle

    init() { }
}

// MARK: - Protocol_MarketCancelOrderContract

struct Protocol_MarketCancelOrderContract {
    // MARK: Properties

    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ownerAddress: Data = .init()

    var orderID: Data = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    // MARK: Lifecycle

    init() { }
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Protocol_MarketSellAssetContract: @unchecked Sendable { }
extension Protocol_MarketCancelOrderContract: @unchecked Sendable { }
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "protocol"

// MARK: - Protocol_MarketSellAssetContract + SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_MarketSellAssetContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".MarketSellAssetContract"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "owner_address"),
        2: .standard(proto: "sell_token_id"),
        3: .standard(proto: "sell_token_quantity"),
        4: .standard(proto: "buy_token_id"),
        5: .standard(proto: "buy_token_quantity"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ownerAddress)
            case 2: try decoder.decodeSingularBytesField(value: &sellTokenID)
            case 3: try decoder.decodeSingularInt64Field(value: &sellTokenQuantity)
            case 4: try decoder.decodeSingularBytesField(value: &buyTokenID)
            case 5: try decoder.decodeSingularInt64Field(value: &buyTokenQuantity)
            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if !ownerAddress.isEmpty {
            try visitor.visitSingularBytesField(value: ownerAddress, fieldNumber: 1)
        }
        if !sellTokenID.isEmpty {
            try visitor.visitSingularBytesField(value: sellTokenID, fieldNumber: 2)
        }
        if sellTokenQuantity != 0 {
            try visitor.visitSingularInt64Field(value: sellTokenQuantity, fieldNumber: 3)
        }
        if !buyTokenID.isEmpty {
            try visitor.visitSingularBytesField(value: buyTokenID, fieldNumber: 4)
        }
        if buyTokenQuantity != 0 {
            try visitor.visitSingularInt64Field(value: buyTokenQuantity, fieldNumber: 5)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_MarketSellAssetContract, rhs: Protocol_MarketSellAssetContract) -> Bool {
        if lhs.ownerAddress != rhs.ownerAddress {
            return false
        }
        if lhs.sellTokenID != rhs.sellTokenID {
            return false
        }
        if lhs.sellTokenQuantity != rhs.sellTokenQuantity {
            return false
        }
        if lhs.buyTokenID != rhs.buyTokenID {
            return false
        }
        if lhs.buyTokenQuantity != rhs.buyTokenQuantity {
            return false
        }
        if lhs.unknownFields != rhs.unknownFields {
            return false
        }
        return true
    }
}

// MARK: - Protocol_MarketCancelOrderContract + SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_MarketCancelOrderContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".MarketCancelOrderContract"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "owner_address"),
        2: .standard(proto: "order_id"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ownerAddress)
            case 2: try decoder.decodeSingularBytesField(value: &orderID)
            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if !ownerAddress.isEmpty {
            try visitor.visitSingularBytesField(value: ownerAddress, fieldNumber: 1)
        }
        if !orderID.isEmpty {
            try visitor.visitSingularBytesField(value: orderID, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_MarketCancelOrderContract, rhs: Protocol_MarketCancelOrderContract) -> Bool {
        if lhs.ownerAddress != rhs.ownerAddress {
            return false
        }
        if lhs.orderID != rhs.orderID {
            return false
        }
        if lhs.unknownFields != rhs.unknownFields {
            return false
        }
        return true
    }
}
