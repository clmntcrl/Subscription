# subscription

Swift typed notification implementation with automatic unregistering

<br />

### Usage

```swift
let valueDidChange = Subscription<String>(name: "valueDidChangeNotification")

var value: String = "" {
    didSet { valueDidChange.next(value) }
}

let subscriptionToken = valueDidChange.subscribe { print($0) }
value = "ok" // ok
value += "!" // ok!
```



