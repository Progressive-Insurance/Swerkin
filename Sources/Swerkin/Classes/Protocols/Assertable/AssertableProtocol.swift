/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

public protocol Assertable: ElementAssertable, WaitAssertable, TextFieldAssertable, ButtonAssertable, ImageAssertable, LabelAssertable, TableCellAssertable { }

public protocol ElementAssertable {
    func elementExists(withIdentifier identifier: String) -> Bool
    func elementExists(withLabel label: String) -> Bool
    func elementExists(withIdentifier identifier: String, withLabel label: String) -> Bool
    func elementExists(withIdentifier identifier: String, withTrait trait: UIAccessibilityTraits) -> Bool
    func elementExists(withIdentifier identifier: String, withValue value: String) -> Bool
    func elementDoesNotExist(withIdentifier identifier: String) -> Bool
    func elementDoesNotExist(withLabel label: String) -> Bool
    func elementDoesNotDisplay(withLabel label: String) -> Bool
    func elementIsTappable(withLabel label: String) -> Bool
    func elementIsTappable(withIdentifier identifier: String) -> Bool
    func elementIsSelected(withLabel label: String) -> Bool
    func elementIsSelected(withIdetifier identifier: String) -> Bool
    func elementIsNotEnabled(withLabel label: String) -> Bool
}

public protocol WaitAssertable {
    func waitForElement(withIdentifier identifier: String, file: StaticString, line: UInt)
    func waitForElement(withLabel label: String, file: StaticString, line: UInt)
    func waitUntilElementIsTappable(withIdentifier identifier: String, file: StaticString, line: UInt)
    func waitUntilElementIsTappable(withLabel label: String, file: StaticString, line: UInt)
    func waitUntilElementDoesNotExist(withIdentifier identifier: String, file: StaticString, line: UInt)
    func waitUntilElementDoesNotExist(withLabel label: String, file: StaticString, line: UInt)
    func waitForSoftwareKeyboard()
    func waitForAbsenceOfSoftwareKeyboard()
}

public protocol TextFieldAssertable {
    func textField(hasText text: String) -> Bool
    func textField(withIdentifier id: String, hasText text: String) -> Bool
    func textField(withLabel label: String, hasText text: String) -> Bool
    func textField(withIdentifier id: String, hasValue value: String) -> Bool
    func textField(withLabel label: String, hasValue value: String) -> Bool
    func textFieldExists(withIdentifier id: String) -> Bool
    func multiLineTextFieldExists(withIdentifier id: String) -> Bool
    func textField(withIdentifier id: String, hasLabel label: String) -> Bool
    func textField(withIdentifier id: String, hasPlaceholder placeholder: String) -> Bool
    func textFieldIsFocused(withLabel label: String) -> Bool
    func textFieldIsFocused(withFieldName label: String) -> Bool
    func textFieldIsFocused(withIdentifier id: String) -> Bool
}

public protocol ButtonAssertable {
    func buttonExists(withLabel label: String) -> Bool
    func buttonExists(withIdentifier id: String) -> Bool
    func buttonExists(withIdentifier id: String, withLabel label: String) -> Bool
    func uiButton(withIdentifier id: String, containsText text: String) -> Bool
}

public protocol ImageAssertable {
    func imageExists(withIdentifier id: String, withLabel label: String?) -> Bool
}

public protocol LabelAssertable {
    func uiLabelExists(withIdentifier id: String) -> Bool
    func uiLabel(withIdentifier id: String, hasText text: String) -> Bool
    func uiLabel(withIdentifier id: String, containsText text: String) -> Bool
}

public protocol TableCellAssertable {
    func tableCellExists(withLabel label: String) -> Bool
}
