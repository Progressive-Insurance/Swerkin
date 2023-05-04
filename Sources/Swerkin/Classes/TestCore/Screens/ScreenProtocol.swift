/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import KIF

/// Protocol for `Screen` objects
public protocol Screen: Viewable, Assertable, Touchable, Renderable, Navigable {
    var test: BaseTestCase { get set }
    init(testCase: BaseTestCase)
}

/// Extension for `Screen` objects to include access to KIF view test actor
public extension Screen {
    var viewTester: KIFUIViewTestActor {
        return self.test.viewTester()
    }
}

/// Protocol for `Renderable` objects
public protocol Renderable {
    var trait: String { get }
    var name: String { get }
    func renderScreen()
}

/// Protocol for `Navigable` objects
public protocol Navigable {
    func entryPathSegments() -> [PathSegment]
}
