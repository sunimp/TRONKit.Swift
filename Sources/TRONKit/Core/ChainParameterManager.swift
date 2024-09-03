//
//  ChainParameterManager.swift
//
//  Created by Sun on 2023/5/26.
//

import Foundation

// MARK: - ChainParameterManager

class ChainParameterManager {
    // MARK: Properties

    private let tronGridProvider: TRONGridProvider
    private let storage: SyncerStorage

    // MARK: Lifecycle

    init(tronGridProvider: TRONGridProvider, storage: SyncerStorage) {
        self.tronGridProvider = tronGridProvider
        self.storage = storage
    }
}

extension ChainParameterManager {
    var сreateNewAccountFeeInSystemContract: Int {
        storage.chainParameter(key: "getCreateNewAccountFeeInSystemContract") ?? 1000000
    }

    var сreateAccountFee: Int {
        storage.chainParameter(key: "getCreateAccountFee") ?? 100000
    }

    var transactionFee: Int {
        storage.chainParameter(key: "getTransactionFee") ?? 1000
    }

    var energyFee: Int {
        storage.chainParameter(key: "getEnergyFee") ?? 420
    }

    func sync() async throws {
        let parameters = try await tronGridProvider.fetchChainParameters()
        for parameter in parameters {
            storage.saveChainParameter(key: parameter.key, value: parameter.value)
        }
    }
}
