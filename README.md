# TronKit.Swift

`TronKit.Swift` is a native(Swift) toolkit for TRON network.

## Core Features

- [x] Local storage of account data (TRX, TRC-10, TRC-20 balances and transactions)
- [x] Synchronization over **HTTP/WebSocket**
- [x] **Watch accounts**. Restore with any address
- [x] Can be extended to natively support any smart contract


## Usage

### Initialization

First you need to initialize an `TronKit.Kit` instance

```swift
import TronKit

let address = try Address(hex: "0x...")

let TronKit = try Kit.instance(
        address: address,
        walletId: "unique_wallet_id",
        minLogLevel: .error
)
```

### Starting and Stopping

`TronKit.Kit` instance requires to be started with `start` command. This start the process of synchronization with the blockchain state.

```swift
TronKit.start()
TronKit.stop()
```

## Installation

### Swift Package Manager

[Swift Package Manager](https://www.swift.org/package-manager) is a dependency manager for Swift projects. You can install it with the following command:

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/TronKit.Swift.git", .upToNextMajor(from: "1.0.8"))
]
```

## Prerequisites

* Xcode 10.0+
* Swift 5.5+
* iOS 13+


## Example Project

All features of the library are used in example project located in `iOS Example` folder. It can be referred as a starting point for usage of the library.

## License

The `TronKit.Swift` toolkit is open source and available under the terms of the [MIT License](https://github.com/sunimp/TronKit.Swift/blob/master/LICENSE).

