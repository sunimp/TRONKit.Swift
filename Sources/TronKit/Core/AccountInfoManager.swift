//
//  AccountInfoManager.swift
//
//  Created by Sun on 2023/5/2.
//

import Combine
import Foundation

import BigInt
import WWExtensions

// MARK: - AccountInfoManager

class AccountInfoManager {
    // MARK: Properties

    var accountActive = true

    private let storage: AccountInfoStorage

    private let trxBalanceSubject = PassthroughSubject<BigUInt, Never>()
    private let trc20BalanceSubject = PassthroughSubject<(Address, BigUInt), Never>()

    // MARK: Computed Properties

    var trxBalance: BigUInt {
        storage.trxBalance ?? 0
    }

    // MARK: Lifecycle

    init(storage: AccountInfoStorage) {
        self.storage = storage
    }
}

extension AccountInfoManager {
    var trxBalancePublisher: AnyPublisher<BigUInt, Never> {
        trxBalanceSubject.eraseToAnyPublisher()
    }

    func trc20Balance(contractAddress: Address) -> BigUInt {
        storage.trc20Balance(address: contractAddress.base58) ?? 0
    }

    func trc20BalancePublisher(contractAddress: Address) -> AnyPublisher<BigUInt, Never> {
        trc20BalanceSubject.filter { $0.0 == contractAddress }.map(\.1).eraseToAnyPublisher()
    }

    func handle(accountInfoResponse: AccountInfoResponse) {
        accountActive = true
        let trxBalance = BigUInt(accountInfoResponse.balance)
        storage.save(trxBalance: trxBalance)
        trxBalanceSubject.send(trxBalance)

        storage.clearTrc20Balances()
        for (address, value) in accountInfoResponse.trc20 {
            storage.save(trc20Balance: value, address: address.base58)
            trc20BalanceSubject.send((address, value))
        }
    }

    func handleInactiveAccount() {
        accountActive = false
        trxBalanceSubject.send(BigUInt.zero)
    }
}
