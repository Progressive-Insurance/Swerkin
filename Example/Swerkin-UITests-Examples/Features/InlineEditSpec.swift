/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class InlineEditSpec: ExampleTestCase {
    private let firstNameTextField = TextFieldScreen.View.firstNameTextField.accessibilityIdentifier
    private let lastTextField = TextFieldScreen.View.lastNameTextField.accessibilityIdentifier
    private let infotextView = TextFieldScreen.View.infoTextView.accessibilityIdentifier
    private let firstNameLabel = TextFieldScreen.View.firstNameLabel.accessibilityIdentifier
    private let firstNameError = TextFieldScreen.View.firstNameError.accessibilityIdentifier
    private let lastNameLabel = TextFieldScreen.View.lastNameLabel.accessibilityIdentifier
    private let lastNameError = TextFieldScreen.View.lastNameError.accessibilityIdentifier

    func testIShouldSeeInLineErrorWithId() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IEnterIntoTextField(firstNameTextField, text: "John1")
        When.ITouchButtonBarButton(withLabel: "done")
        Then.IShouldSeeInlineError(firstNameError)
    }

    func testIShouldNotSeeInLineErrorWithId() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldNotSeeInlineError(lastNameError)
    }

    func testIShouldSeeInLineErrorWithIdAndText() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IEnterIntoTextField(firstNameTextField, text: "John1")
        When.ITouchButtonBarButton(withLabel: "done")
        Then.IShouldSeeInlineError(firstNameError,
                                   withText: "This is an error label")
    }

    func testIShouldNotSeeInLineErrorWithIdAndText() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldNotSeeInlineError(lastNameError,
                                      withText: "This is an error label")
    }

    func testIShouldSeeInLineErrorWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IEnterIntoTextField(firstNameTextField, text: "John1")
        When.ITouchButtonBarButton(withLabel: "done")
        Then.IShouldSeeInlineError(withLabel: "This is an error label")
    }

    func testIShouldNotSeeInLineErrorWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldNotSeeInlineError(withLabel: "This is an error label")
    }

    func testIShouldSeeInLineErrorWithIdAndContainingText() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IEnterIntoTextField(firstNameTextField, text: "John1")
        When.ITouchButtonBarButton(withLabel: "done")
        Then.IShouldSeeInlineError(firstNameError, containingText: "error")
    }
}
