/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import KIF

/// Extend steps to include access to the test case and the KIF view and UI test actors
extension Steps {

    /// Instance of the current UI test case
    public var testCase: BaseTestCase! {
        get {
            if let testCase = self.test as? BaseTestCase {
                return testCase
            } else {
                XCTFail("Could not cast XCTestCase to BaseTestCase ")
                return nil
            }
        }
    }

    /// Instance of the current view test actor
    public var viewTester: KIFUIViewTestActor! {
        return self.test.viewTester()
    }

    /// Instance of the current UI test actor
    public var UITester: KIFUITestActor! {
        return self.test.UITester()
    }
}
