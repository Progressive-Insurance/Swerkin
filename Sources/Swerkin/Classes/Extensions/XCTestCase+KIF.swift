/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Foundation
import XCTest
import KIF

#if SWIFT_PACKAGE
@_exported import SwerkinAdditions
#endif

extension XCTestCase {

    var tester: KIFUIViewTestActor { return viewTester() }
    var system: KIFSystemTestActor { return system() }
    var UITester: KIFUITestActor { return UITester() }

    func UITester(_ file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func viewTester(_ file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(_ file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }

    @nonobjc func wait( for condition: @autoclosure @escaping () -> Bool, errorMessage: String, timeout: TimeInterval = 2.0, negateCondition: Bool = false, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(WaitForConditionWithTimeout(timeout, negateCondition ? { !condition() } : { condition() }), errorMessage, file: file, line: line)
    }

    @nonobjc func wait( for condition: @escaping () -> Bool, errorMessage: String, timeout: TimeInterval = 2.0, negateCondition: Bool = false, file: StaticString = #file, line: UInt = #line) {
        XCTAssertTrue(WaitForConditionWithTimeout(timeout, negateCondition ? { !condition() } : { condition() }), errorMessage, file: file, line: line)
    }
}
