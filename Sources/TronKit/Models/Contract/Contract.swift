//
//  Contract.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import ObjectMapper

// MARK: - Contract

public protocol Contract: ImmutableMappable {
    var label: String { get }
    func ownTransaction(ownAddress: Address) -> Bool
}

// MARK: - AccountCreateContract

public struct AccountCreateContract: Contract {
    public static let type = "AccountCreateContract"
    public var label = "Create Account"

    let ownerAddress: Address
    let accountAddress: Address
    let type: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountAddress = try map.value("account_address", using: HexAddressTransform())
        type = try map.value("type")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - TransferContract

public struct TransferContract: Contract {
    public static let type = "TransferContract"
    public var label = "Transfer TRX"

    public let amount: Int
    public let ownerAddress: Address
    public let toAddress: Address

    public init(amount: Int, ownerAddress: Address, toAddress: Address) {
        self.amount = amount
        self.ownerAddress = ownerAddress
        self.toAddress = toAddress
    }

    public init(map: Map) throws {
        amount = try map.value("amount")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - TransferAssetContract

public struct TransferAssetContract: Contract {
    public static let type = "TransferAssetContract"
    public var label = "Transfer TRC10 Asset"

    public let amount: Int
    public let assetName: String
    public let ownerAddress: Address
    public let toAddress: Address

    public init(map: Map) throws {
        amount = try map.value("amount")
        assetName = try map.value("asset_name")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - VoteWitnessContract

public struct VoteWitnessContract: Contract {
    public static let type = "VoteWitnessContract"
    public var label = "Vote Witness"

    public let ownerAddress: Address
    public let votes: [Vote]

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        votes = try map.value("votes")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public struct Vote: ImmutableMappable {
        public let voteAddress: Address
        public let voteCount: Int

        public init(map: Map) throws {
            voteAddress = try map.value("vote_address", using: HexAddressTransform())
            voteCount = try map.value("vote_count")
        }
    }
}

// MARK: - WitnessCreateContract

public struct WitnessCreateContract: Contract {
    public static let type = "WitnessCreateContract"
    public var label = "Witness Create"

    public let ownerAddress: Address
    public let url: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        url = try map.value("url")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - AssetIssueContract

public struct AssetIssueContract: Contract {
    public static let type = "AssetIssueContract"
    public var label = "Asset Issue"

    public struct FrozenSupply: ImmutableMappable {
        public let frozenAmount: Int
        public let frozenDays: Int

        public init(map: Map) throws {
            frozenAmount = try map.value("frozen_amount")
            frozenDays = try map.value("frozen_days")
        }
    }

    public let ownerAddress: Address
    public let name: String
    public let abbr: String
    public let precision: Int
    public let totalSupply: Int
    public let frozenSupply: FrozenSupply?
    public let trxNum: Int
    public let num: Int
    public let startTime: Int
    public let endTime: Int
    public let order: Int?
    public let voteScore: Int?
    public let description: String?
    public let url: String?
    public let freeAssetNetLimit: Int?
    public let publicFreeAssetNetLimit: Int?
    public let publicFreeAssetNetUsage: Int?
    public let publicLatestFreeNetTime: Int?

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        name = try map.value("name")
        abbr = try map.value("abbr")
        precision = try map.value("precision")
        totalSupply = try map.value("total_supply")
        frozenSupply = try? map.value("frozen_supply")
        trxNum = try map.value("trx_num")
        num = try map.value("num")
        startTime = try map.value("start_time")
        endTime = try map.value("end_time")
        order = try map.value("order")
        voteScore = try map.value("vote_score")
        description = try map.value("description")
        url = try map.value("url")
        freeAssetNetLimit = try map.value("free_asset_net_limit")
        publicFreeAssetNetLimit = try map.value("public_free_asset_net_limit")
        publicFreeAssetNetUsage = try map.value("public_free_asset_net_usage")
        publicLatestFreeNetTime = try map.value("public_latest_free_net_time")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - WitnessUpdateContract

public struct WitnessUpdateContract: Contract {
    public static let type = "WitnessUpdateContract"
    public var label = "Witness Update"
    public let ownerAddress: Address
    public let updateURL: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        updateURL = try map.value("update_url")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - ParticipateAssetIssueContract

public struct ParticipateAssetIssueContract: Contract {
    public static let type = "ParticipateAssetIssueContract"
    public var label = "Participate Asset Issue"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address
    public let toAddress: Address
    public let assetName: String
    public let amount: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        toAddress = try map.value("to_address", using: HexAddressTransform())
        assetName = try map.value("asset_name")
        amount = try map.value("amount")
    }
}

// MARK: - AccountUpdateContract

public struct AccountUpdateContract: Contract {
    public static let type = "AccountUpdateContract"
    public var label = "Account Update"

    public let ownerAddress: Address
    public let accountName: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountName = try map.value("account_name")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - FreezeBalanceContract

public struct FreezeBalanceContract: Contract {
    public static let type = "FreezeBalanceContract"
    public var label = "Freeze Balance"

    public let ownerAddress: Address
    public let frozenBalance: Int
    public let frozenDuration: Int
    public let resource: String
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        frozenBalance = try map.value("frozen_balance")
        frozenDuration = try map.value("frozen_duration")
        resource = try map.value("resource")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UnfreezeBalanceContract

public struct UnfreezeBalanceContract: Contract {
    public static let type = "UnfreezeBalanceContract"
    public var label = "Unfreeze Balance"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address
    public let resource: String
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }
}

// MARK: - WithdrawBalanceContract

public struct WithdrawBalanceContract: Contract {
    public static let type = "WithdrawBalanceContract"
    public var label = "Withdraw Balance"

    let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UnfreezeAssetContract

public struct UnfreezeAssetContract: Contract {
    public static let type = "UnfreezeAssetContract"
    public var label = "Unfreeze Asset"

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UpdateAssetContract

public struct UpdateAssetContract: Contract {
    public static let type = "UpdateAssetContract"
    public var label = "Update Asset"

    public let ownerAddress: Address
    public let description: String
    public let url: String
    public let newLimit: Int
    public let newPublicLimit: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        description = try map.value("description")
        url = try map.value("url")
        newLimit = try map.value("new_limit")
        newPublicLimit = try map.value("new_public_limit")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - ProposalCreateContract

public struct ProposalCreateContract: Contract {
    public static let type = "ProposalCreateContract"
    public var label = "Proposal Create"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - ProposalApproveContract

public struct ProposalApproveContract: Contract {
    public static let type = "ProposalApproveContract"
    public var label = "Proposal Approve"

    public let ownerAddress: Address
    public let proposalID: Int
    public let isAddApproval: Bool

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        proposalID = try map.value("proposal_id")
        isAddApproval = try map.value("is_add_approval")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - ProposalDeleteContract

public struct ProposalDeleteContract: Contract {
    public static let type = "ProposalDeleteContract"
    public var label = "Proposal Delete"

    public let ownerAddress: Address
    public let proposalID: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        proposalID = try map.value("proposal_id")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - SetAccountIDContract

public struct SetAccountIDContract: Contract {
    public static let type = "SetAccountIdContract"
    public var label = "Set Account Id"

    public let ownerAddress: Address
    public let accountID: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        accountID = try map.value("account_id")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - CreateSmartContract

public struct CreateSmartContract: Contract {
    public static let type = "CreateSmartContract"
    public var label = "Create SmartContract"

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - TriggerSmartContract

public struct TriggerSmartContract: Contract {
    public static let type = "TriggerSmartContract"
    public var label = "Trigger SmartContract"

    let data: String
    let ownerAddress: Address
    let contractAddress: Address
    let callValue: Int?
    let callTokenValue: Int?
    let tokenID: Int?
    let functionSelector: String?
    let parameter: String?

    public init(
        data: String,
        ownerAddress: Address,
        contractAddress: Address,
        callValue: Int?,
        callTokenValue: Int?,
        tokenID: Int?,
        functionSelector: String?,
        parameter: String?
    ) {
        self.data = data
        self.ownerAddress = ownerAddress
        self.contractAddress = contractAddress
        self.callValue = callValue
        self.callTokenValue = callTokenValue
        self.tokenID = tokenID
        self.functionSelector = functionSelector
        self.parameter = parameter
    }

    public init(map: Map) throws {
        data = try map.value("data")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        callValue = try map.value("call_value")
        callTokenValue = try map.value("call_token_value")
        tokenID = try map.value("token_id")
        functionSelector = nil
        parameter = nil
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UpdateSettingContract

public struct UpdateSettingContract: Contract {
    public static let type = "UpdateSettingContract"
    public var label = "Update Setting"

    public let ownerAddress: Address
    public let contractAddress: Address
    public let consumeUserResourcePercent: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        consumeUserResourcePercent = try map.value("consume_user_resource_percent")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - ExchangeCreateContract

public struct ExchangeCreateContract: Contract {
    public static let type = "ExchangeCreateContract"
    public var label = "Exchange Create"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - ExchangeInjectContract

public struct ExchangeInjectContract: Contract {
    public static let type = "ExchangeInjectContract"
    public var label = "Exchange Inject"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - ExchangeWithdrawContract

public struct ExchangeWithdrawContract: Contract {
    public static let type = "ExchangeWithdrawContract"
    public var label = "Exchange Withdraw"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - ExchangeTransactionContract

public struct ExchangeTransactionContract: Contract {
    public static let type = "ExchangeTransactionContract"
    public var label = "Exchange Transaction"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - ClearABIContract

public struct ClearABIContract: Contract {
    public static let type = "ClearABIContract"
    public var label = "Clear ABI"

    public let ownerAddress: Address
    public let contractAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UpdateBrokerageContract

public struct UpdateBrokerageContract: Contract {
    public static let type = "UpdateBrokerageContract"
    public var label = "Update Brokerage"

    public let ownerAddress: Address
    public let brokerage: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        brokerage = try map.value("brokerage")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UpdateEnergyLimitContract

public struct UpdateEnergyLimitContract: Contract {
    public static let type = "UpdateEnergyLimitContract"
    public var label = "Update Energy Limit"

    public let ownerAddress: Address
    public let contractAddress: Address
    public let originEnergyLimit: Int

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        contractAddress = try map.value("contract_address", using: HexAddressTransform())
        originEnergyLimit = try map.value("origin_energy_limit")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - FreezeBalanceV2Contract

public struct FreezeBalanceV2Contract: Contract {
    public static let type = "FreezeBalanceV2Contract"
    public var label = "Freeze Balance V2"

    let resource: String?
    let frozenBalance: Int
    let ownerAddress: Address

    public init(map: Map) throws {
        resource = try map.value("resource")
        frozenBalance = try map.value("frozen_balance")
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UnfreezeBalanceV2Contract

public struct UnfreezeBalanceV2Contract: Contract {
    public static let type = "UnfreezeBalanceV2Contract"
    public var label = "Unfreeze Balance V2"

    public let ownerAddress: Address
    public let unfreezeBalance: Int
    public let resource: String

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        unfreezeBalance = try map.value("unfreeze_balance")
        resource = try map.value("resource")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - WithdrawExpireUnfreezeContract

public struct WithdrawExpireUnfreezeContract: Contract {
    public static let type = "WithdrawExpireUnfreezeContract"
    public var label = "Withdraw Expire Unfreeze"

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }

    public let ownerAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
    }
}

// MARK: - DelegateResourceContract

public struct DelegateResourceContract: Contract {
    public static let type = "DelegateResourceContract"
    public var label = "Delegate Resource"

    public let ownerAddress: Address
    public let resource: String
    public let balance: Int
    public let receiverAddress: Address
    public let lock: Bool

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        balance = try map.value("balance")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
        lock = try map.value("lock")
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UnDelegateResourceContract

public struct UnDelegateResourceContract: Contract {
    public static let type = "UnDelegateResourceContract"
    public var label = "Undelegate Resource"

    public let ownerAddress: Address
    public let resource: String
    public let balance: Int
    public let receiverAddress: Address

    public init(map: Map) throws {
        ownerAddress = try map.value("owner_address", using: HexAddressTransform())
        resource = try map.value("resource")
        balance = try map.value("balance")
        receiverAddress = try map.value("receiver_address", using: HexAddressTransform())
    }

    public func ownTransaction(ownAddress: Address) -> Bool {
        ownerAddress == ownAddress
    }
}

// MARK: - UnknownContract

public struct UnknownContract: Contract {
    public static let type = "UnknownContract"
    public var label = "Unknown"

    public let data: Data

    public init(map: Map) throws {
        try self.init(object: map.JSON)
    }

    public init(object: Any) throws {
        data = try JSONSerialization.data(withJSONObject: object)
    }

    public func ownTransaction(ownAddress _: Address) -> Bool {
        false
    }
}
