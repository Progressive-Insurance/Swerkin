/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

public extension Assertable where Self: Screen {

    func elementExists(withIdentifier identifier: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier)?.isHidden == false
    }

    func elementExists(withLabel label: String) -> Bool {
        return self.viewTester.view(withLabel: label)?.isHidden == false
    }

    func elementExists(withIdentifier identifier: String, withLabel label: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier, withLabel: label)?.isHidden == false
    }

    func elementExists(withIdentifier identifier: String, withTrait trait: UIAccessibilityTraits) -> Bool {
        return self.viewTester.viewWith(trait: trait, andIdentifier: identifier)?.isHidden == false
    }

    func elementExists(withIdentifier identifier: String, withValue value: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier, withValue: value)?.isHidden == false
    }

    func elementDoesNotExist(withIdentifier identifier: String) -> Bool {
        return elementExists(withIdentifier: identifier) == false
    }

    func elementDoesNotExist(withLabel label: String) -> Bool {
        return elementExists(withLabel: label) == false
    }

    func elementDoesNotDisplay(withLabel label: String) -> Bool {
        let isHidden = self.viewTester.view(withLabel: label)?.isHidden
        return isHidden == nil || isHidden == true

    }

    func elementIsTappable(withLabel label: String) -> Bool {
        return self.viewTester.view(withLabel: label)?.isProbablyTappable == true
    }

    func elementIsTappable(withIdentifier identifier: String) -> Bool {
        return self.viewTester.view(withIdentifier: identifier)?.isProbablyTappable == true
    }

    func elementIsSelected(withLabel label: String) -> Bool {
        return self.viewTester.viewWith(trait: .selected, andLabel: label) != nil
    }

    func elementIsSelected(withIdetifier identifier: String) -> Bool {
        return self.viewTester.viewWith(trait: .selected, andIdentifier: identifier) != nil
    }

    func elementIsNotEnabled(withLabel label: String) -> Bool {
        return self.viewTester.viewWith(trait: .notEnabled, andLabel: label) != nil
    }

    func waitForElement(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.test.waiting(for: self.elementExists(withIdentifier: identifier), errorMessage: "Did not find element with id \(identifier)", file: file, line: line)
    }

    func waitForElement(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.test.waiting(for: self.elementExists(withLabel: label), errorMessage: "Did not find element with label \(label)", file: file, line: line)
    }

    func waitUntilElementDoesNotExist(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.test.waiting(for: self.elementExists(withIdentifier: identifier), errorMessage: "Did not find element with id \(identifier)", negateCondition: true, file: file, line: line)
    }

    func waitUntilElementDoesNotExist(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.test.waiting(for: self.elementExists(withLabel: label), errorMessage: "Did not find element with label \(label)", negateCondition: true, file: file, line: line)
    }

    func waitUntilElementIsTappable(withIdentifier identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.viewTester.usingIdentifier(identifier).waitForTappableView()
    }

    func waitUntilElementIsTappable(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.viewTester.usingLabel(label).waitForTappableView()
    }

    func waitForAbsenceOfSoftwareKeyboard() {
        self.viewTester.waitForAbsenceOfSoftwareKeyboard()
    }

    func waitForSoftwareKeyboard() {
        self.viewTester.waitForSoftwareKeyboard()
    }

    func buttonExists(withLabel label: String) -> Bool {
        return self.viewTester.button(withLabel: label) != nil
    }

    func buttonExists(withIdentifier id: String) -> Bool {
        return self.viewTester.button(withIdentifier: id) != nil
    }

    func buttonExists(withIdentifier id: String, withLabel label: String) -> Bool {
        return self.viewTester.button(withIdentifier: id, withLabel: label) != nil
    }

    func uiButton(withIdentifier id: String, containsText text: String) -> Bool {
        guard let button: UIButton = self.viewTester.button(withIdentifier: id) else {
            return false
        }
        return button.titleLabel?.text?.contains(text) ?? false
    }

    func imageExists(withIdentifier id: String, withLabel label: String? = nil) -> Bool {
        return self.viewTester.image(withIdentifier: id, withLabel: label) != nil
    }

    func uiLabelExists(withIdentifier id: String) -> Bool {
        guard let _: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return true
    }

    func uiLabel(withIdentifier id: String, hasText text: String) -> Bool {
        guard let label: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return label.text == text
    }

    func uiLabel(withIdentifier id: String, containsText text: String) -> Bool {
        guard let label: UILabel = self.viewTester.label(withIdentifier: id) else {
            return false
        }
        return label.text?.contains(text) ?? false
    }

    func textField(withIdentifier id: String, hasText text: String) -> Bool {
        guard let textBox: UITextField = self.viewTester.textField(withIdentifier: id) else {
            return false
        }
        return textBox.text == text
    }

    func textField(withLabel label: String, hasText text: String) -> Bool {
        guard let textBox: UITextField = self.viewTester.textField(withLabel: label) else {
            return false
        }
        return textBox.text == text
    }

    func textField(hasText text: String) -> Bool {
        let found = self.viewTester.usingValue(text)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingValue(text)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    func textFieldExists(withIdentifier id: String) -> Bool {
        return self.viewTester.textField(withIdentifier: id) != nil
    }

    func multiLineTextFieldExists(withIdentifier id: String) -> Bool {
        return self.viewTester.multiLineTextField(withIdentifier: id) != nil
    }

    func textField(withIdentifier id: String, hasValue value: String) -> Bool {
        let found = self.viewTester.usingIdentifier(id).usingValue(value)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingIdentifier(id).usingValue(value)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    func textField(withLabel label: String, hasValue value: String) -> Bool {
        let found = self.viewTester.usingLabel(label).usingValue(value)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingLabel(label).usingValue(value)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    func textField(withIdentifier id: String, hasLabel label: String) -> Bool {
        let found = self.viewTester.usingIdentifier(id).usingLabel(label)?.tryFindingView() ?? false
        if found {
            let element = self.viewTester.usingIdentifier(id).usingLabel(label)
            guard let _: UITextField = element?.view as? UITextField else {
                return false
            }
        }
        return found
    }

    func textField(withIdentifier id: String, hasPlaceholder placeholder: String) -> Bool {
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

    func textFieldIsFocused(withIdentifier id: String) -> Bool {
        if let textField: UITextField = self.viewTester.textField(withIdentifier: id) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    func textFieldIsFocused(withLabel label: String) -> Bool {
        if let textField: UITextField = self.viewTester.textField(withLabel: label) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    func textFieldIsFocused(withFieldName label: String) -> Bool {
        if let textField: UITextField = self.test.viewTester().textField(withFieldLabel: label) {
            return textField.isEditing
        } else {
            XCTFail("Not a text field")
            return false
        }
    }

    func tableCellExists(withLabel label: String) -> Bool {
        return self.viewTester.tableCell(withLabel: label) != nil
    }

    func tableCellExists(withIdentifier id: String) -> Bool {
        return self.viewTester.tableCell(withIdentifier: id) != nil
    }

    func tableCellExists(withIdentifier id: String, withLabel label: String) -> Bool {
        return self.viewTester.tableCell(withIdentifier: id, withLabel: label) != nil
    }
}
