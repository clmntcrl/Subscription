# Subscription

Type-safe subscription to NotificationCenter with self unsubscription.

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

### [Carthage](https://github.com/Carthage/Carthage)

Add the following dependency to your `Cartfile`:

```ruby
github "clmntcrl/subscription" ~> 0.1
```

### [CocoaPods](https://cocoapods.org)

Add the following pod to your `Podfile`:

```ruby
pod 'Subscription', '~> 0.1'
```

### [SwiftPM](https://github.com/apple/swift-package-manager)

Add the package as dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/clmntcrl/swidux-subscription.git", from: "0.1.1"),
]
```

## License

Subscription is released under the MIT license. See [LICENSE](LICENSE) for details.
