/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

@MainActor
class ExampleBaseScreen: @MainActor Screen, Navigable {
    final var test: BaseTestCase
    
    final let renderer: ScreenRenderer = ExampleScreenRenderer()

    public required init(testCase: BaseTestCase) {
        self.test = testCase
    }

    final var testName: String { return test.name }

    var trait: String { return "" }
    var name: String { return "" }
    @MainActor func create() -> UIViewController { UIViewController() }
    @MainActor func renderScreen() {}
    func entryPathSegments() -> [PathSegment] {
        return []
    }
}
