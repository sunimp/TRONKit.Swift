// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: core/contract/proposal_contract.proto
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

// MARK: - Protocol_ProposalApproveContract

struct Protocol_ProposalApproveContract {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ownerAddress: Data = .init()

    var proposalID: Int64 = 0

    /// add or remove approval
    var isAddApproval = false

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() { }
}

// MARK: - Protocol_ProposalCreateContract

struct Protocol_ProposalCreateContract {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ownerAddress: Data = .init()

    var parameters: [Int64: Int64] = [:]

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() { }
}

// MARK: - Protocol_ProposalDeleteContract

struct Protocol_ProposalDeleteContract {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ownerAddress: Data = .init()

    var proposalID: Int64 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() { }
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Protocol_ProposalApproveContract: @unchecked Sendable { }
extension Protocol_ProposalCreateContract: @unchecked Sendable { }
extension Protocol_ProposalDeleteContract: @unchecked Sendable { }
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "protocol"

// MARK: - Protocol_ProposalApproveContract + SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_ProposalApproveContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding
{
    static let protoMessageName: String = _protobuf_package + ".ProposalApproveContract"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "owner_address"),
        2: .standard(proto: "proposal_id"),
        3: .standard(proto: "is_add_approval"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ownerAddress)
            case 2: try decoder.decodeSingularInt64Field(value: &proposalID)
            case 3: try decoder.decodeSingularBoolField(value: &isAddApproval)
            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if !ownerAddress.isEmpty {
            try visitor.visitSingularBytesField(value: ownerAddress, fieldNumber: 1)
        }
        if proposalID != 0 {
            try visitor.visitSingularInt64Field(value: proposalID, fieldNumber: 2)
        }
        if isAddApproval != false {
            try visitor.visitSingularBoolField(value: isAddApproval, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_ProposalApproveContract, rhs: Protocol_ProposalApproveContract) -> Bool {
        if lhs.ownerAddress != rhs.ownerAddress { return false }
        if lhs.proposalID != rhs.proposalID { return false }
        if lhs.isAddApproval != rhs.isAddApproval { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

// MARK: - Protocol_ProposalCreateContract + SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_ProposalCreateContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding
{
    static let protoMessageName: String = _protobuf_package + ".ProposalCreateContract"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "owner_address"),
        2: .same(proto: "parameters"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ownerAddress)

            case 2: try decoder.decodeMapField(
                    fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt64, SwiftProtobuf.ProtobufInt64>.self,
                    value: &parameters
                )

            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if !ownerAddress.isEmpty {
            try visitor.visitSingularBytesField(value: ownerAddress, fieldNumber: 1)
        }
        if !parameters.isEmpty {
            try visitor.visitMapField(
                fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufInt64, SwiftProtobuf.ProtobufInt64>.self,
                value: parameters,
                fieldNumber: 2
            )
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_ProposalCreateContract, rhs: Protocol_ProposalCreateContract) -> Bool {
        if lhs.ownerAddress != rhs.ownerAddress { return false }
        if lhs.parameters != rhs.parameters { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

// MARK: - Protocol_ProposalDeleteContract + SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding

extension Protocol_ProposalDeleteContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding
{
    static let protoMessageName: String = _protobuf_package + ".ProposalDeleteContract"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "owner_address"),
        2: .standard(proto: "proposal_id"),
    ]

    mutating func decodeMessage(decoder: inout some SwiftProtobuf.Decoder) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ownerAddress)
            case 2: try decoder.decodeSingularInt64Field(value: &proposalID)
            default: break
            }
        }
    }

    func traverse(visitor: inout some SwiftProtobuf.Visitor) throws {
        if !ownerAddress.isEmpty {
            try visitor.visitSingularBytesField(value: ownerAddress, fieldNumber: 1)
        }
        if proposalID != 0 {
            try visitor.visitSingularInt64Field(value: proposalID, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Protocol_ProposalDeleteContract, rhs: Protocol_ProposalDeleteContract) -> Bool {
        if lhs.ownerAddress != rhs.ownerAddress { return false }
        if lhs.proposalID != rhs.proposalID { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
