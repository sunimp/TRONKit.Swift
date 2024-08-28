// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: core/TronInventoryItems.proto
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

// MARK: - Protocol_InventoryItems

struct Protocol_InventoryItems {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var type: Int32 = 0

    var items: [Data] = []

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() { }
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Protocol_InventoryItems: @unchecked Sendable { }
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "protocol"

// MARK: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_InventoryItems: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding
{
    static let protoMessageName: String = _protobuf_package + ".InventoryItems"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "type"),
        2: .same(proto: "items"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularInt32Field(value: &type)
            case 2: try decoder.decodeRepeatedBytesField(value: &items)
            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if type != 0 {
            try visitor.visitSingularInt32Field(value: type, fieldNumber: 1)
        }
        if !items.isEmpty {
            try visitor.visitRepeatedBytesField(value: items, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_InventoryItems, rhs: Protocol_InventoryItems) -> Bool {
        if lhs.type != rhs.type { return false }
        if lhs.items != rhs.items { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
