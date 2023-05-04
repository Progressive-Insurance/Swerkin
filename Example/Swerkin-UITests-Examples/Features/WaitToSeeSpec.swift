/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class WaitToSeeSpec: ExampleTestCase {

    private let alert = WaitToSeeScreen.View.alert.accessibilityIdentifier
    private let alertButton = WaitToSeeScreen.View.alertButton.accessibilityIdentifier
    private let firstImage = WaitToSeeScreen.View.firstImage.accessibilityIdentifier
    private let firstLabel = WaitToSeeScreen.View.firstLabel.accessibilityIdentifier
    private let fifthLabel = WaitToSeeScreen.View.fifthLabel.accessibilityIdentifier
    private let fourthLabel = WaitToSeeScreen.View.fourthLabel.accessibilityIdentifier
    private let loader = WaitToSeeScreen.View.loader.accessibilityIdentifier
    private let scrollLoader = WaitToSeeScreen.View.scrollLoader.accessibilityIdentifier
    private let secondImage = WaitToSeeScreen.View.secondImage.accessibilityIdentifier
    private let secondLabel = WaitToSeeScreen.View.secondLabel.accessibilityIdentifier
    private let sixthLabel = WaitToSeeScreen.View.sixthLabel.accessibilityIdentifier
    private let switchItem = WaitToSeeScreen.View.switchItem.accessibilityIdentifier
    private let thirdLabel = WaitToSeeScreen.View.thirdLabel.accessibilityIdentifier

    func testIWaitToSeeScreen() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        When.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        Then.IWaitToSeeScreen(ExamplePresentableScreen.waitToSeeScreen)
    }

    func testIWaitToSeeElementwithPartialLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        When.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        Then.IWaitToSeeElement(withPartialLabel: "is the only item in")
    }

    func testIWaitToSeeElementwithLabelPrefix() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        When.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        Then.IWaitToSeeElement(withLabelPrefix: "This label is the")
    }

    func testIWaitToSeeElementwithLabelSuffix() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        When.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        Then.IWaitToSeeElement(withLabelSuffix: "the stackview initially")
    }

    func testIWaitToSeeElementwithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        When.IWaitToSeeElement(withLabel: "This label is the only item in the stackview initially")
        Then.IShouldSeeLabel(firstLabel, withText: "This label is the only item in the stackview initially")
    }

    func testIWaitUntilIDoNotSeeElementwithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        When.ITouchButton(loader)
        Then.IWaitUntilIDoNotSeeElement(withLabel: "This is just another label that is added by the above button")
    }

    func testIWaitUntilIDoNotSeeElement() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        When.ITouchButton(loader)
        Then.IWaitUntilIDoNotSeeElement(secondLabel)
    }

    func testIWaitToSeeTappableElement() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        When.ITouchButton(loader)
        Then.IWaitToSeeTappableElement(scrollLoader)
    }

    func testIWaitToSeeTappableElementwithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        When.ITouchButton(loader)
        Then.IWaitToSeeTappableElement(withLabel: "This button loads more items to force scrolling")
    }

    func testIWaitToSeeAlert() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        And.ITouchButton(loader)
        And.IWaitToSeeTappableElement(scrollLoader)
        And.ITouchButton(scrollLoader)
        And.IWaitToSeeTappableElement(alertButton)
        When.ITouchButton(alertButton)
        Then.IWaitToSeeAlert()
        And.ITouchElement(withLabel: "Cancel")
        And.IWaitToSeeScreen(ExamplePresentableScreen.waitToSeeScreen)
    }

    func testIWaitToSeeElement() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        And.ITouchButton(loader)
        And.IWaitToSeeTappableElement(scrollLoader)
        When.ITouchButton(scrollLoader)
        Then.IWaitToSeeElement(switchItem)
    }

    func testIWaitToSeeElementwithValue() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        And.ITouchButton(loader)
        And.IWaitToSeeTappableElement(scrollLoader)
        When.ITouchButton(scrollLoader)
        Then.IWaitToSeeElement(withValue: "1")
    }

    func testIWaitForSeconds() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        And.ITouchButton(loader)
        And.IWaitToSeeTappableElement(scrollLoader)
        When.ITouchButton(scrollLoader)
        Then.IWaitForSeconds(5)
    }

    func testIScrollDownUntilISeeElementwithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.waitToSeeScreen)
        And.IRender(screen: ExamplePresentableScreen.waitToSeeScreen)
        And.ITouchButton(loader)
        And.IWaitToSeeTappableElement(scrollLoader)
        When.ITouchButton(scrollLoader)
        Then.IScrollDownUntilISeeElement(withLabel: "This label is also togglable")
    }
}
