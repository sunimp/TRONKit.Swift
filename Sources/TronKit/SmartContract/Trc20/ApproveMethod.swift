//
//  ApproveMethod.swift
//
//  Created by Sun on 2023/5/17.
//

import BigInt

class ApproveMethod: ContractMethod {
    // MARK: Static Properties

    static let methodSignature = "approve(address,uint256)"

    // MARK: Overridden Properties

    override var methodSignature: String { ApproveMethod.methodSignature }
    override var arguments: [Any] { [spender, value] }

    // MARK: Properties

    let spender: Address
    let value: BigUInt

    // MARK: Lifecycle

    init(spender: Address, value: BigUInt) {
        self.spender = spender
        self.value = value

        super.init()
    }
}
