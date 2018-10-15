# Subscription

Type-safe subscription to NotificationCenter with self unsubscription.

<br />

## Usage

```swift
let valueDidChange = Subscription<String>(name: "valueDidChangeNotification")

var value: String = "ok" {
    didSet { valueDidChange.next(value) }
}

let subscriptionToken = valueDidChange.subscribe { print($0) }
value += "!" // print: "ok!"
```

For more details, feel free to take a look at `Subscription.playground`.

## Installation

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/clmntcrl/subscription.git", from: "0.1.0"),
    ]
)
```
