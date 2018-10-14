//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation

public struct Subscription<A> {

    public let name: Notification.Name
    public let center: NotificationCenter

    let encode: (A) -> Notification
    let decode: (Notification) -> A
}

public extension Subscription {

    public init(name: String = "\(UUID().uuidString)_Notification", center: NotificationCenter = .default) {
        let name = Notification.Name(name)
        self.name = name
        self.center = center

        self.encode = { payload in Notification(name: name, object: nil, userInfo: ["payload": payload]) }
        self.decode = { $0.userInfo!["payload"] as! A }
    }

    public func subscribe(_ onNext: @escaping (A) -> Void) -> SubscriptionToken {
        let token = center.addObserver(forName: name, object: .none, queue: .none) {
            onNext(self.decode($0))
        }
        return .init(token: token, center: center)
    }

    public func next(_ value: A) {
        center.post(encode(value))
    }
}

extension Subscription {

    static func from(
        systemNotificationWithName name: Notification.Name,
        center: NotificationCenter = .default
    ) -> Subscription<[AnyHashable: Any]?> {

        return .init(
            name: name,
            center: center,
            encode: { userInfo in Notification(name: name, object: nil, userInfo: userInfo) },
            decode: { return $0.userInfo }
        )
    }
}
