//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import Foundation

public extension NotificationCenter {

    public func addObserver<A>(
        for subscription: Subscription<A>,
        queue: OperationQueue? = .none,
        using block: @escaping (A) -> Void
    ) -> SubscriptionToken {

        return subscription.subscribe(block)
    }

    public func post<A>(subscription: Subscription<A>, value: A) {
        subscription.next(value)
    }
}
