//
//  Signer.swift
//  TronKit
//
//  Created by Sun on 2024/8/21.
//

import Foundation

import BigInt
import HDWalletKit
import WWCryptoKit
import WWToolKit

// MARK: - Signer

public class Signer {
    private let privateKey: Data

    init(privateKey: Data) {
        self.privateKey = privateKey
    }

    func signature(hash: Data) throws -> Data {
        try Crypto.ellipticSign(hash, privateKey: privateKey)
    }
}

extension Signer {
    
    public static func instance(seed: Data) throws -> Signer {
        try Signer(privateKey: privateKey(seed: seed))
    }

    public static func address(seed: Data) throws -> Address {
        try address(privateKey: privateKey(seed: seed))
    }

    public static func address(privateKey: Data) throws -> Address {
        let publicKey = Data(Crypto.publicKey(privateKey: privateKey, compressed: false).dropFirst())
        return try Address(raw: [0x41] + Data(Crypto.sha3(publicKey).suffix(20)))
    }

    public static func privateKey(string: String) throws -> Data {
        guard let data = string.ww.hexData else {
            throw PrivateKeyValidationError.invalidDataString
        }

        guard data.count == 32 else {
            throw PrivateKeyValidationError.invalidDataLength
        }

        return data
    }

    public static func privateKey(seed: Data) throws -> Data {
        let hdWallet = HDWallet(seed: seed, coinType: 195, xPrivKey: HDExtendedKeyVersion.xprv.rawValue)
        return try hdWallet.privateKey(account: 0, index: 0, chain: .external).raw
    }
}

// MARK: Signer.PrivateKeyValidationError

extension Signer {
    public enum PrivateKeyValidationError: Error {
        case invalidDataString
        case invalidDataLength
    }
}
