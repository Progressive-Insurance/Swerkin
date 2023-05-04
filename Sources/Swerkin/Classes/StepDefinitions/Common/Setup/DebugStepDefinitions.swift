/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

extension Steps {
    /// Print all accessibility labels of the top most view controller
    public func IPrintAllLabels() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let labels = UIWindow().topMostController()?.view.getAllAccessibilityLabels()
            print("========================")
            print(labels as Any)
            print("========================")
        }
    }

    /// Print all accessibility identifiers of the top most view controller
    public func IPrintAllIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let ids = UIWindow().topMostController()?.view.getAllAccessibilityIdentifiers()
            print("========================")
            print(ids as Any)
            print("========================")
        }
    }

    /// Print all accessibility labels and identifiers of the top most view controller
    public func IPrintAllLabelsAndIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let allElements = UIWindow().topMostController()?.view.getAllAccessibilityElements()
            print("========================")
            print(allElements as Any)
            print("========================")
        }
    }
}
