/*:

# Subscription

Type-safe subscription to NotificationCenter with self unsubscription.
*/
import Foundation
import Subscription
/*:

 ## Usage

 ### Create a typed subscription
*/
let myStringDidChange = Subscription<String>()
/*:
 Behind the scene `Subscription` generate a `Notification.Name` which rely on a `UUID` to ensure its uniqueness. However you could also use a custom name if it's something you want to.
*/
let myIntDidChange = Subscription<Int>(name: "myIntDidChangeNotification")
/*:

 ### Subscribe

 Lets create a subscriber object that will subscribe to `myStringDidChange` and `myIntDidChange`.
 */
class Subscriber {

    var subscriptionTokens = [
        myStringDidChange.subscribe { print("myString: \($0)") },
        myIntDidChange.subscribe { print("myInt: \($0)") },
    ]

    init() {}
}
/*:
 Subscription tokens are used to self unregister subscribers' closures when tokens are deinit, so you need to keep a reference to the token to be able to receive `Notification`.

 For following example, this means that subscriptions will be unregistered when `subscriber` will be set to `nil` (this is shown few lines below).
 */
var subscriber: Subscriber? = Subscriber()
/*:

 ### Notify subscribers
*/
var myString = "a" {
    didSet { myStringDidChange.next(myString) }
}
var myInt = 0 {
    didSet { NotificationCenter.default.post(subscription: myIntDidChange, value: myInt) }
}
/*:
 This 2 notations are equivalent and ensure that subscritpion and value are refering to the same type.

 Now we just have to mutate `myString` and `myInt` to see what happen.
*/
myString = "b" // print: "myString: b"
myString = "c" // print: "myString: c"
myInt += 1 // print: "myInt: 1"
/*:
 And then set our subscriber to `nil` to see that subscriber's closures are unregistered.
*/
subscriber = .none
myString = "d"
myInt += 1
