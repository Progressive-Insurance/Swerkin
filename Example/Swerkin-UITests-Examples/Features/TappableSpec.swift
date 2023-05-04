/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TappableSpec: ExampleTestCase {
    
    private let checkBox = TappableScreen.View.checkBox.accessibilityIdentifier
    private let toggleSwitch = TappableScreen.View.toggleSwitch.accessibilityIdentifier
    private let toggleSwitch2 = TappableScreen.View.toggleSwitch2.accessibilityIdentifier
    private let Link = TappableScreen.View.link.accessibilityIdentifier
    private let infoButton = TappableScreen.View.infoButton.accessibilityIdentifier
    private let doneButton = TappableScreen.View.doneButton.accessibilityIdentifier
    private let popUpButton = TappableScreen.View.popUpButton.accessibilityIdentifier
    private let hello = TappableScreen.View.helloLabel.accessibilityIdentifier
    
    func testVerifyCheckBoxtp() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ITapCheckbox(checkBox)
        Then.IShouldSeeElement(withLabel: "CheckBox tapped")
    }
    
    func testVerifyCheckBoxDoubleTap() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        And.ITapCheckbox(checkBox)
        When.ITapCheckbox(checkBox)
        Then.IShouldSeeElement(withLabel: "CheckBox Untapped")
    }
    
    func testVerifySwitchOnToggle() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.IToggleSwitch(toggleSwitch, to: true)
        Then.IShouldSeeElement(withLabel: "Switch1 is ON")
    }
    
    func testVerifySwitchOffToggle() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.IToggleSwitch(toggleSwitch2, to: false)
        Then.IShouldSeeElement(withLabel: "Switch2 is OFF")
    }
    
    func testVerifyLongPressWithIdentifier() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ILongPressElement(Link)
        Then.IShouldSeeElement(withLabel: "Long Button Pressed")
    }
    
    func testVerifyLongPressWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ILongPressElement(withLabel: "Long Press")
        Then.IShouldSeeElement(withLabel: "Long Button Pressed")
    }
    
    func testVerifyBarButtonClick() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeElement(withLabel: "Done bar button item")
    }
    
    func testVerifyDismissPopoverElement() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ITouchElement(popUpButton)
        Then.IShouldSeeLabel(hello, withText: "Hello")
        And.IDismissPopoverElement()
    }
    
    func testVerifyDismissModal() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ITouchElement(popUpButton)
        Then.IShouldSeeLabel(hello, withText: "Hello")
        And.IDismissModal()
    }

//    func testVerifyBackButton() {
//        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
//        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
//        When.IGoBack()
//        Then.IWaitToSeeScreen(ExamplePresentableScreen.homeScreen)
//    }
    
    func testVerifyTouchMiddleOf() {
        Given.IAmOnScreen(ExamplePresentableScreen.tappableScreen)
        And.IRender(screen: ExamplePresentableScreen.tappableScreen)
        When.ITouchMiddleOf(doneButton)
        Then.IShouldSeeElement(withLabel: "Done bar button item")
    }
}
