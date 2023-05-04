/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

public extension UIApplication {
    func rootNavigationController() -> UINavigationController? {
        guard let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }
        return keyWindow.rootViewController as? UINavigationController
    }

    func topViewController() -> UIViewController? {
        return rootNavigationController()?.topViewController
    }

    @objc
    func topNavigationController() -> UINavigationController? {
        if let navigation = topViewController() {
            return navigation.navigationController
        }
        return nil
    }
}
