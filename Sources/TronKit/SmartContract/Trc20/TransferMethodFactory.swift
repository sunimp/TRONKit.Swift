import BigInt
import Foundation

class TransferMethodFactory: IContractMethodFactory {
    let methodID: Data = ContractMethodHelper.methodID(signature: TransferMethod.methodSignature)

    func createMethod(inputArguments: Data) throws -> ContractMethod {
        let to = try Address(raw: inputArguments[12 ..< 32])
        let value = BigUInt(inputArguments[32 ..< 64])

        return TransferMethod(to: to, value: value)
    }
}
