/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TextFieldSpec: ExampleTestCase {
    
    private let firstNameTextField = TextFieldScreen.View.firstNameTextField.accessibilityIdentifier
    private let lastTextField = TextFieldScreen.View.lastNameTextField.accessibilityIdentifier
    private let infotextView = TextFieldScreen.View.infoTextView.accessibilityIdentifier
    private let firstNameLabel = TextFieldScreen.View.firstNameLabel.accessibilityIdentifier
    private let firstNameError = TextFieldScreen.View.firstNameError.accessibilityIdentifier
    private let lastNameLabel = TextFieldScreen.View.lastNameLabel.accessibilityIdentifier
    private let lastNameError = TextFieldScreen.View.lastNameError.accessibilityIdentifier
    
    func testVerifyExistenceOfFirstNameTextField() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(firstNameTextField)
    }
    
    func testVerifyExistenceOfFirstNameTextFieldWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(withLabel: "first name text Field", withText: "John")
     }
    
    func testVerifyExistenceOfFirstNameTextFieldWithLabelAndIsNotFocussed() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(withLabel: "first name text Field", isFocused: false)
     }
    
    func testVerifyExistenceOfFirstNameTextFieldWithLabelAndIsFocussed() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        When.ITouchElement(firstNameTextField)
        Then.IShouldSeeTextField(withLabel: "first name text Field", isFocused: true)
     }
    
    func testVerifyExistenceOfFirstNameTextFieldWithAccessibilityLabelOrValue() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(firstNameTextField, withValue:  "John")
     }
    
    
    func testVerifyExistenceOfFirstNameTextFieldWithPlaceHolder() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(firstNameTextField, withPlaceholder: "Enter Name")
     }
    
    func testVerifyExistenceOfFirstNameTextFieldAndIsNotFocused() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(firstNameTextField, isFocused: false)
     }
    
    func testVerifyExistenceOfFirstNameTextFieldAndIsFocused() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        When.ITouchElement(firstNameTextField)
        Then.IShouldSeeTextField(firstNameTextField, isFocused: true)
     }
    
    
    func testVerifyExistenceOfEnabledTextField() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(firstNameTextField, isEnabled:true )
     }
    
    
    func testVerifyExistenceOfDisabledTextField() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(lastTextField, isEnabled:false )
     }
   
    
    func testVerifyExistenceOfnameTextFieldWithAccessibilityLabelAndValue() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.IShouldSeeTextField(withLabel: "first name text Field", andValue: "John")
     }
    
    
    func testVerifyExistenceOfTextFieldandEnter() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IShouldSeeTextField(firstNameTextField)
        When.IEnterIntoTextField(firstNameTextField, text: "John")
        Then.IShouldSeeTextField(firstNameTextField, withValue:  "John")
    }
    
    
    func testVerifyTouchTextFieldWithIdentifier() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        Then.ITouchTextBox(firstNameTextField)
    }
    
    func testVerifyTouchTextFieldAndTouchButton() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.ITouchTextBox(firstNameTextField)
        Then.ITouchButtonBarButton(withLabel: "done")
    }
    
    func testVerifyEnterTextFieldAndTouchButton() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        When.IEnterIntoTextFieldAndTouchButton(firstNameTextField, text: "Johann")
        And.IWaitUntilIDoNotSeeElement(withLabel: "done")
        Then.IShouldNotSeeElement(withLabel: "done")
    }
    
    func testVerifyClearTextField() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IEnterIntoTextField(firstNameTextField, text: "John Doe")
        When.IClearTextField(firstNameTextField)
        Then.IShouldSeeTextField(firstNameTextField, withPlaceholder: "Enter Name")
    }
    
    func testVerifyEnterTextInTextView() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        When.IEnterIntoMultiLineTextField(infotextView, text: "These are additional notes clarifying what exactly happened")
        Then.IShouldSeeElement(infotextView , withValue: "These are additional notes clarifying what exactly happened")
    }
    
    func testVerifyClearTextView() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        And.IShouldSeeElement(infotextView)
        When.IClearMultiLineTextField(infotextView)
        And.IEnterIntoMultiLineTextField(infotextView, text: " ")
        And.ITouchButtonBarButton(withLabel: "done")
        Then.IShouldSeeElement(containingValue: " ")
    }
    
    func testTouchTextViewWithIdentifier() {
        Given.IAmOnScreen(ExamplePresentableScreen.textFieldScreen)
        And.IRender(screen: ExamplePresentableScreen.textFieldScreen)
        And.IWaitToSeeScreen(ExamplePresentableScreen.textFieldScreen)
        When.ITouchElement(infotextView)
        Then.IShouldSeeElement(withLabel: "done")
        And.ITouchButtonBarButton(withLabel: "done")
    }
}
