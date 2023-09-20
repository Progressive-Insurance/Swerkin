/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit
import XCTest

extension Steps: Assertable {

    public func elementExists(withIdentifier identifier: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier)?.isHidden == false
    }

    public func elementExists(withIdentifier identifier: String, withLabel label: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier, withLabel: label)?.isHidden == false
    }

    public func elementExists(withIdentifier identifier: String, withTrait trait: UIAccessibilityTraits) -> Bool {
        return self.viewTester.viewWith(trait: trait, andIdentifier: identifier)?.isHidden == false
    }

    public func elementExists(withIdentifier identifier: String, withValue value: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier, withValue: value)?.isHidden == false
    }

    public func elementExists(withLabel label: String) -> Bool {
        return self.viewTester.view(withLabel: label)?.isHidden == false
    }

    public func elementExists(withLabelPrefix labelPrefix: String) -> Bool {
        return self.viewTester.view(withLabelPrefix: labelPrefix)?.isHidden == false
    }

    public func elementExists(withLabelSuffix labelSuffix: String) -> Bool {
        return self.viewTester.view(withLabelSuffix: labelSuffix)?.isHidden == false
    }

    public func elementExists(withPartialLabel partialLabel: String) -> Bool {
        return self.viewTester.view(andLabelContains: partialLabel) != nil
    }

    public func elementExists(withLabelMatchingPattern pattern: String) -> Bool {
        let predicate = NSPredicate(format: "accessibilityLabel MATCHES %@", argumentArray: [pattern])
        return viewTester.view(withPredicate: predicate) != nil
    }

    public func elementExists(withValue value: String) -> Bool {
        return self.viewTester.view(withValue: value) != nil
    }

    public func elementDoesNotExist(withIdentifier identifier: String) -> Bool {
        return elementExists(withIdentifier: identifier) == false
    }

    public func elementDoesNotExist(withLabel label: String) -> Bool {
        return elementExists(withLabel: label) == false
    }

    public func elementDoesNotDisplay(withLabel label: String) -> Bool {
        let isHidden = self.viewTester.view(withLabel: label)?.isHidden
        return isHidden == nil || isHidden == true
    }

    public func elementIsTappable(withLabel label: String) -> Bool {
        return self.viewTester.view(withLabel: label)?.isProbablyTappable == true
    }

    public func elementIsTappable(withIdentifier identifier: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier)?.isProbablyTappable == true
    }

    public func elementIsSelected(withLabel label: String) -> Bool {
        return self.viewTester.viewWith(trait: .selected, andLabel: label) != nil
    }

    public func elementIsSelected(withIdetifier identifier: String) -> Bool {
        return self.viewTester.viewWith(trait: .selected, andIdentifier: identifier) != nil
    }

    public func elementIsNotEnabled(withLabel label: String) -> Bool {
        return self.viewTester.viewWith(trait: .notEnabled, andLabel: label) != nil
    }

    public func waitForElement(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withIdentifier: identifier), errorMessage: "Did not find element with id \(identifier)", file: file, line: line)
    }

    public func waitForElement(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withLabel: label), errorMessage: "Did not find element with label \(label)", file: file, line: line)
    }

    public func waitForElement(withLabelPrefix labelPrefix: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withLabelPrefix: labelPrefix), errorMessage: "Did not find element with label prefix \(labelPrefix)", file: file, line: line)
    }

    public func waitForElement(withLabelSuffix labelSuffix: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withLabelSuffix: labelSuffix), errorMessage: "Did not find element with label suffix \(labelSuffix)", file: file, line: line)
    }

    public func waitForElement(withPartialLabel partialLabel: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withPartialLabel: partialLabel), errorMessage: "Did not find element with partial label \(partialLabel)", file: file, line: line)
    }

    public func waitForElement(withValue value: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withValue: value), errorMessage: "Did not find element with value \(value)", file: file, line: line)
    }

    public func waitUntilElementDoesNotExist(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withIdentifier: identifier), errorMessage: "Did not find element with id \(identifier)", negateCondition: true, file: file, line: line)
    }

    public func waitUntilElementDoesNotExist(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.testCase.waiting(for: self.elementExists(withLabel: label), errorMessage: "Did not find element with label \(label)", negateCondition: true, file: file, line: line)
    }

    public func waitUntilElementIsTappable(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.viewTester.usingIdentifier(identifier).waitForTappableView()
    }

    public func waitUntilElementIsTappable(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.viewTester.usingLabel(label).waitForTappableView()
    }

    public func waitForAbsenceOfSoftwareKeyboard() {
        self.viewTester.waitForAbsenceOfSoftwareKeyboard()
    }

    public func waitForSoftwareKeyboard() {
        self.viewTester.waitForSoftwareKeyboard()
    }

    public func buttonExists(withLabel label: String) -> Bool {
        return self.viewTester.button(withLabel: label) != nil
    }

    public func buttonExists(withIdentifier id: String) -> Bool {
        return self.viewTester.button(withIdentifier: id) != nil
    }

    public func buttonExists(withIdentifier id: String, withLabel label: String) -> Bool {
        return self.viewTester.button(withIdentifier: id, withLabel: label) != nil
    }

    public func imageExists(withIdentifier id: String, withLabel label: String? = nil) -> Bool {
        return self.viewTester.image(withIdentifier: id, withLabel: label) != nil
    }

    public func uiLabelExists(withIdentifier id: String) -> Bool {
        guard let _: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return true
    }

    public func uiLabelText(for id: String) -> String {
        guard let label: UILabel = self.viewTester.label(withIdentifier: id) else {
            return ""
        }
        return label.text ?? ""
    }

    public func uiLabel(withIdentifier id: String, hasText text: String) -> Bool {
        guard let label: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return label.text == text
    }

    public func uiLabel(withIdentifier id: String, containsText text: String) -> Bool {
        guard let label: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return label.text?.contains(text) ?? false
    }

    public func uiButtonText(for id: String) -> String {
        guard let button: UIButton = self.viewTester.button(withIdentifier: id) else {
            return ""
        }
        return button.titleLabel?.text ?? ""
    }

    public func uiButton(withIdentifier id: String, containsText text: String) -> Bool {
        guard let button: UIButton = self.viewTester.button(withIdentifier: id) else {
            return false
        }
        return button.titleLabel?.text?.contains(text) ?? false
    }

    public func textFieldText(for id: String) -> String {
        guard let textBox: UITextField = self.viewTester.textField(withIdentifier: id) else {
            return ""
        }
        return textBox.text ?? ""
    }

    public func textField(withIdentifier id: String, hasText text: String) -> Bool {
        guard let textBox: UITextField = self.viewTester.textField(withIdentifier: id) else {
            return false
        }
        return textBox.text == text
    }

    public func textFieldText(forLabel label: String) -> String {
        guard let textBox: UITextField = self.viewTester.textField(withLabel: label) else {
            return ""
        }
        return textBox.text ?? ""
    }

    public func textField(withLabel label: String, hasText text: String) -> Bool {
        guard let textBox: UITextField = self.viewTester.textField(withLabel: label) else {
            return false
        }
        return textBox.text == text
    }

    public func textField(hasText text: String) -> Bool {
        let found = self.viewTester.usingValue(text)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingValue(text)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    public func textFieldExists(withIdentifier id: String) -> Bool {
        return self.viewTester.textField(withIdentifier: id) != nil
    }

    public func multiLineTextFieldExists(withIdentifier id: String) -> Bool {
        return self.viewTester.multiLineTextField(withIdentifier: id) != nil
    }

    public func textField(withIdentifier id: String, hasValue value: String) -> Bool {
        let found = self.viewTester.usingIdentifier(id).usingValue(value)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingIdentifier(id).usingValue(value)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    public func textField(withLabel label: String, hasValue value: String) -> Bool {
        let found = self.viewTester.usingLabel(label).usingValue(value)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingLabel(label).usingValue(value)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    public func textField(withIdentifier id: String, hasLabel label: String) -> Bool {
        let found = self.viewTester.usingIdentifier(id).usingLabel(label)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingIdentifier(id).usingLabel(label)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    public func textFieldPlaceholder(for id: String) -> String {
        guard let textBox: UITextField = self.viewTester.textField(withIdentifier: id) else {
            return ""
        }
        return textBox.placeholder ?? ""
    }

    public func textField(withIdentifier id: String, hasPlaceholder placeholder: String) -> Bool {
        var found = false
        let element = self.viewTester.usingIdentifier(id)
        if element != nil {
            found = element?.tryFindingView() ?? false
            guard let view: UITextField = element?.view as? UITextField else {
                return false
            }
            found = (view.placeholder == placeholder)
        }
        return found
    }

    public func textFieldIsFocused(withLabel label: String) -> Bool {
        if let textField: UITextField = self.viewTester.textField(withLabel: label) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    public func textFieldIsFocused(withFieldName label: String) -> Bool {
        if let textField: UITextField = self.test.viewTester().textField(withFieldLabel: label) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    public func textFieldIsFocused(withIdentifier id: String) -> Bool {
        if let textField: UITextField = self.viewTester.textField(withIdentifier: id) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    public func tableCellExists(withLabel label: String) -> Bool {
        return self.viewTester.tableCell(withLabel: label) != nil
    }

    public func tableCellExists(withIdentifier id: String) -> Bool {
        return self.viewTester.tableCell(withIdentifier: id) != nil
    }

    public func tableCellExists(withIdentifier id: String, withLabel label: String) -> Bool {
        return self.viewTester.tableCell(withIdentifier: id, withLabel: label) != nil
    }
}
