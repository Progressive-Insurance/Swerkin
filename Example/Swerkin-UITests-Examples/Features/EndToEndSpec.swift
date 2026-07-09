/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class EndToEndSpec: ExampleTestCase {

    private let startButton = EndToEndScreen.View.startTestButton.accessibilityIdentifier

    func testINavigateToScreen() {
        Given.IAmOnScreen(ExamplePresentableScreen.endToEndScreen)
        And.IRender(screen: ExamplePresentableScreen.endToEndScreen)
        When.INavigate(fromScreen: ExamplePresentableScreen.endToEndScreen,
                       toScreen: ExamplePresentableScreen.dropDownScreen)
        Then.IWaitToSeeScreen(ExamplePresentableScreen.dropDownScreen)
    }
}
