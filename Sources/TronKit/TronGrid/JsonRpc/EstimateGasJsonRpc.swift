import BigInt
import Foundation

class EstimateGasJsonRpc: IntJsonRpc {
    init(from: Address, to: Address?, amount: BigUInt?, gasPrice: Int, data: Data?) {
        var params: [String: Any] = [
            "from": from.raw.ww.hexString,
        ]

        if let to {
            params["to"] = to.raw.ww.hexString
        }
        if let amount {
            params["value"] = "0x" + (amount == 0 ? "0" : amount.serialize().ww.hex.ww.removeLeadingZeros())
        }
        params["gasPrice"] = "0x" + String(gasPrice, radix: 16).ww.removeLeadingZeros()
        if let data {
            params["data"] = data.ww.hexString
        }

        super.init(
            method: "eth_estimateGas",
            params: [params]
        )
    }
}
