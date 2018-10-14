# Subscription

Swift self unregistering typed notification.

---

## Usage

```swift
let valueDidChange = Subscription<String>(name: "valueDidChangeNotification")

var value: String = "ok" {
    didSet { valueDidChange.next(value) }
}

let subscriptionToken = valueDidChange.subscribe { print($0) }
value += "!" // ok!
```
