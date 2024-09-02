//
//  ContractMethodFactories.swift
//
//  Created by Sun on 2023/5/17.
//

import Foundation

// MARK: - IContractMethodFactory

public protocol IContractMethodFactory {
    var methodID: Data { get }
    func createMethod(inputArguments: Data) throws -> ContractMethod
}

// MARK: - IContractMethodsFactory

public protocol IContractMethodsFactory: IContractMethodFactory {
    var methodIDs: [Data] { get }
}

extension IContractMethodsFactory {
    var methodID: Data { Data() }
}

// MARK: - ContractMethodFactories

open class ContractMethodFactories {
    // MARK: Nested Types

    public enum DecodeError: Error {
        case invalidABI
    }

    // MARK: Properties

    private var factories = [Data: IContractMethodFactory]()

    // MARK: Lifecycle

    public init() { }

    // MARK: Functions

    public func register(factories: [IContractMethodFactory]) {
        for factory in factories {
            if let methodsFactory = factory as? IContractMethodsFactory {
                for methodID in methodsFactory.methodIDs {
                    self.factories[methodID] = factory
                }
            } else {
                self.factories[factory.methodID] = factory
            }
        }
    }

    public func createMethod(input: Data) -> ContractMethod? {
        let methodID = Data(input.prefix(4))
        let factory = factories[methodID]

        return try? factory?.createMethod(inputArguments: Data(input.suffix(from: 4)))
    }
}
