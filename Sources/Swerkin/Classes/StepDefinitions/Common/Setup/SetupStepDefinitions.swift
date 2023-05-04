/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Sets the current screen in the test case to a given presentable screen
    /// - Parameter screen: PresentableScreen
    public func IAmOnScreen(_ screen: PresentableScreen) {
        if self.stepType == .Given {
            self.performStep([screen.rawValue]) {
                self.testCase.currentScreen = screen
            }
        } else {
            XCTFail("IAmOnScreen must be in the Given")
        }
    }

    /// Render a given presentable screen for the system under test
    /// - Parameter screen: PresentableScreen
    public func IRender(screen: PresentableScreen) {
        self.performStep([screen.rawValue]) {
            if let screen = self.testCase.screenPresenter.screen(screen) {
                screen.renderScreen()
            } else {
                XCTFail("Screen \(screen.rawValue) is not found")
            }
        }
    }

    /// Navigate from one screen to another via a set of step definitions
    /// - Parameters:
    ///   - fromScreen: PresentableScreen on which the execution path starts
    ///   - toScreen: PresentableScreen on which the execution path ends
    public func INavigate(fromScreen: PresentableScreen, toScreen: PresentableScreen) {
        self.performStep([fromScreen.rawValue, toScreen.rawValue]) {
            self.testCase.viewTester().waitForAnimationsToFinish()
            self.executeSteps(from: fromScreen, to: toScreen)
        }
    }
}
