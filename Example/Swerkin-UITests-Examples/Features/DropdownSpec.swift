/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class Dropdown: ExampleTestCase {
    private let textField = DropdownScreen.View.textField.accessibilityIdentifier
    
    func testVerifySingleItem() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(textField, toValue: "Banana")
        Then.IShouldSeeTextField(textField, withText: "Banana")
    }

    func testVerifyWithLabelItem() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(withLabel: "textField", toValue: "Orange")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }
    
    func testVerifyMultipleItems() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(textField, toValue: "Orange Broccoli")
        Then.IShouldSeeTextField(textField, withText: "Orange Broccoli")
    }

    func testVerifyWithValueAndItem() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(withValue: "Select Fruit/Veggie", toValue: "Orange")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }

    func testVerifyWithIDAndLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISetDropDown(textField , withLabel: "textField", toValue: "Orange")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }
    
    func testVerifySelectionOfDefaultValueWithId() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectDefaultValueFromDropDown(textField)
        Then.IShouldSeeTextField(textField, withText: "Apple")
    }
    
    func testVerifySelectionOfDefaultValueWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectDefaultValueFromDropDown(withLabel: "textField")
        Then.IShouldSeeTextField(textField, withText: "Apple")
    }
    
    func testVerifySelectionOfEmptyValueWithId() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectEmptyValueFromDropDown(textField)
        Then.IShouldSeeTextField(textField, withText: "")
    }
    
    func testVerifySelectionOfEmptyValueWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectEmptyValueFromDropDown(withLabel: "textField")
        Then.IShouldSeeTextField(textField, withText: "")
    }
    
    /// Waiting for Kif framework to fix  the UIPicker View.
    
    func xtestVerifySingleItemSelectFromDropDown() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectFromDropDown(textField, item: "Banana")
        And.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeTextField(textField, withText: "Banana")
    }

    func xtestVerifyWithLabelItemSelectFromDropDown() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectFromDropDown(textField, item: "Orange")
        And.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }
    
    func xtestVerifyMultipleItemsSelectFromDropDown() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectFromDropDown(textField, items: ["Orange", "Broccoli"])
        And.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeTextField(textField, withText: "Orange Broccoli")
    }

    func xtestVerifyWithValueAndItemSelectFromDropDown() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectFromDropDown(withValue: "Select Fruit/Veggie", item: "Orange")
        And.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }

    func xtestVerifyWithValueAndItemLabelSelectFromDropDown() {
        Given.IAmOnScreen(ExamplePresentableScreen.dropDownScreen)
        And.IRender(screen: ExamplePresentableScreen.dropDownScreen)
        When.ISelectFromDropDown(textField , withLabel: "textField", item: "Orange")
        And.ITouchButtonBarButton(withLabel: "Done")
        Then.IShouldSeeTextField(textField, withText: "Orange")
    }
}
