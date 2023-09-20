/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Foundation
import UIKit

public extension UIWindow {

    /** @return Returns the current Top Most ViewController in hierarchy.   */
    func topMostController() -> UIViewController? {

        var topController = rootViewController

        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }

        return topController
    }

    /** @return Returns the topViewController in stack of topMostController.    */
    func currentViewController() -> UIViewController? {

        let currentViewController = topMostController()

        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as? UINavigationController)?.topViewController != nil {
            if let topViewController = (currentViewController as? UINavigationController)?.topViewController {
                return topViewController
            }
        }

        return currentViewController
    }
}
