# TRONKit.Swift

`TRONKit.Swift` is a native(Swift) toolkit for TRON network.

## Core Features

- [x] Local storage of account data (TRX, TRC-10, TRC-20 balances and transactions)
- [x] Synchronization over **HTTP/WebSocket**
- [x] **Watch accounts**. Restore with any address
- [x] Can be extended to natively support any smart contract


## Usage

### Initialization

First you need to initialize an `TRONKit.Kit` instance

```swift
import TRONKit

let address = try Address(hex: "0x...")

let TRONKit = try Kit.instance(
        address: address,
        walletID: "unique_wallet_id",
        minLogLevel: .error
)
```

### Starting and Stopping

`TRONKit.Kit` instance requires to be started with `start` command. This start the process of synchronization with the blockchain state.

```swift
TRONKit.start()
TRONKit.stop()
```

## Installation

### Swift Package Manager

[Swift Package Manager](https://www.swift.org/package-manager) is a dependency manager for Swift projects. You can install it with the following command:

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/TRONKit.Swift.git", .upToNextMajor(from: "1.2.0"))
]
```
## Requirements

* Xcode 15.4+
* Swift 5.10+
* iOS 14.0+

## Example Project

All features of the library are used in example project located in `iOS Example` folder. It can be referred as a starting point for usage of the library.

## License

The `TRONKit.Swift` toolkit is open source and available under the terms of the [MIT License](https://github.com/sunimp/TRONKit.Swift/blob/main/LICENSE).

