/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class ButtonSpec: ExampleTestCase {
    
    private let enableButton = ButtonScreen.View.enableButton.accessibilityIdentifier
    private let disableButton = ButtonScreen.View.disableButton.accessibilityIdentifier
    private let highLightedButton = ButtonScreen.View.highLightedButton.accessibilityIdentifier

    func testVerifyExistenceOfEnableButtton() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(enableButton)
    }
    
    func testVerifyExistenceOfDisableButtton() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(disableButton)
    }
    
    func testVerifyExistenceOfEnableButtonWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(withLabel: "Enable Button")
    }
    
    func testVerifyExistenceOfEnableButtonWithContainsText() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(enableButton, containsText:"Enable")
    }
    
    func testVerifyExistenceOfEnableButtonWithEnabledCheck() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(enableButton, isEnabled: true)
    }
    
    func testVerifyExistenceOfDisableButtonWithDisabledCheck() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(disableButton, isEnabled: false)
    }
    
//    func testVerifyExistenceOfEnabledButtonWithHighLightCheck() {
//        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
//        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
//        And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
//        When.ITouchButton(highLightedButton)
//        Then.IShouldSeeButton(highLightedButton, isHighlighted: true)
//    }
    
    func testVerifyExistenceOfEnableButtonWithNameAndDisabledCheck() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(withLabel:"Enable Button" , isEnabled: true)
    }
    
    func testVerifyExistenceOfDisableButtonWithNameAndDisabledCheck() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        Then.IShouldSeeButton(withLabel:"Disable Button" , isEnabled: false)
    }
        
    func testEnableButtonTouch() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        And.IShouldSeeButton(enableButton)
        When.ITouchButton(enableButton)
        Then.IShouldSeeElement(withLabel: "Enable Button Clicked")
    }
    
    func testEnableButtonTouchWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        When.ITouchButton(withLabel: "Enable Button")
        Then.IShouldSeeElement(withLabel: "Enable Button Clicked")
    }
    
    func testEnableButtonTouchWithButtonIdandLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.buttonScreen)
        And.IRender(screen: ExamplePresentableScreen.buttonScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
        When.ITouchButton(enableButton , withLabel: "Enable Button")
        Then.IShouldSeeElement(withLabel: "Enable Button Clicked")
    }
}
