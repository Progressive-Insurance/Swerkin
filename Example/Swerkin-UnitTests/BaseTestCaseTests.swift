/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import XCTest
import Swerkin

class BaseTestCaseTests: XCTestCase {

    let baseTestCase = BaseTestCase()

    func testTestTimeout() {
        XCTAssertTrue(self.baseTestCase.testTimeout == 60,
                      "Default value is 60")
    }

    func testWaitingTimeout() {
        XCTAssertTrue(self.baseTestCase.waitingTimeout == 2,
                      "Default value is 2")
    }

    func testValidationTimeout() {
        let validationTimeout = BaseTestCase.validationTimeout
        XCTAssertTrue(validationTimeout == 2,
                      "Default value is 2")
    }
}
