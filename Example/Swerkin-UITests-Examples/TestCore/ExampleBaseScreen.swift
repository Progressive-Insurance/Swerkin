/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class ExampleBaseScreen: Screen, Navigable {
    final var test: BaseTestCase
    
    final let renderer: ScreenRenderer = ExampleScreenRenderer()

    public required init(testCase: BaseTestCase) {
        self.test = testCase
    }

    final var testName: String { return test.name }

    var trait: String { return "" }
    var name: String { return "" }
    func create() -> UIViewController { UIViewController() }
    func renderScreen() {}
    func entryPathSegments() -> [PathSegment] {
        return []
    }
}
