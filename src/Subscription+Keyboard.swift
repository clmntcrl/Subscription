//  Created by Cyril Clément
//  Copyright © 2018 clmntcrl. All rights reserved.

import UIKit
import Foundation

extension Subscription where A == Any {

    static var keyboardWillShow: Subscription<[AnyHashable:Any]?> {
        return .from(systemNotificationWithName: UIWindow.keyboardWillShowNotification)
    }

    static var keyboardWillHide: Subscription<[AnyHashable:Any]?> {
        return .from(systemNotificationWithName: UIWindow.keyboardWillHideNotification)
    }
    
    static var keyboardWillChangeFrame: Subscription<[AnyHashable:Any]?> {
        return .from(systemNotificationWithName: UIWindow.keyboardWillChangeFrameNotification)
    }
}
