/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import XCTest

extension Steps {

    /// Verify UITextField exists with given accessibility idenitifier and text
    /// - Parameters:
    ///   - textFieldId: accessibility idenitifier
    ///   - withText: text
    public func IShouldSeeTextField(_ textFieldId: String, withText text: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, textFieldId]) {
            self.IWaitToSeeElement(textFieldId)
            let textValue = text == "nothing" ? "" : text
            let actualText = textFieldText(for: textFieldId)
            XCTAssertTrue(self.textField(withIdentifier: textFieldId, hasText: textValue), "\(textFieldId) text box expected text: \(text) but has actual text: \(actualText)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility label and text
    /// - Parameters:
    ///   - withLabel: accessibility label
    ///   - withText: text
    public func IShouldSeeTextField(withLabel label: String, withText text: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, label]) {
            self.IWaitToSeeElement(withLabel: label)
            let textValue = text == "nothing" ? "" : text
            let actualText = textFieldText(forLabel: label)
            XCTAssertTrue(self.textField(withLabel: label, hasText: textValue), "\(label) text box expected text: \(text) but has actual text: \(actualText)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility idenitifier and accessibiliity value
    /// - Parameters:
    ///   - identifier: accessibility idenitifier
    ///   - withValue: accessibiliity value
    public func IShouldSeeTextField(_ identifier: String, withValue value: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([value, identifier]) {
            self.IWaitToSeeElement(identifier)
            let textValue = value == "nothing" ? "" : value
            guard let actualValue = element(withIdentifier: identifier)?.accessibilityValue else {
                XCTFail("\(identifier) has no accessibilityValue")
                return
            }
            XCTAssertTrue(self.textField(withIdentifier: identifier, hasValue: textValue), "\(identifier) text box expected value: \(value) but has actual value: \(actualValue)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility label and accessibiliity value
    /// - Parameters:
    ///   - withLabel: accessibility label
    ///   - andValue: accessibiliity value
    public func IShouldSeeTextField(withLabel label: String, andValue value: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([value, label]) {
            self.IWaitToSeeElement(withLabel: label)
            let textValue = value == "nothing" ? "" : value
            guard let actualValue = element(withLabel: label)?.accessibilityValue else {
                XCTFail("\(label) text box has no accessibilityValue")
                return
            }
            XCTAssertTrue(self.textField(withLabel: label, hasValue: textValue), "\(label) text box expected value: \(value) but has actual value: \(actualValue)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility idenitifier and accessibiliity label
    /// - Parameters:
    ///   - identifier: accessibility idenitifier
    ///   - withLabel: accessibiliity label
    public func IShouldSeeTextField(_ identifier: String, withLabel label: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([label, identifier]) {
            self.IWaitToSeeElement(identifier)
            let text = label == "nothing" ? "" : label
            guard let actualLabel = element(withIdentifier: identifier)?.accessibilityLabel else {
                XCTFail("\(identifier) text box has no accessibilityLabel")
                return
            }
            XCTAssertTrue(self.textField(withIdentifier: identifier, hasLabel: text), "\(identifier) text box expected label: \(label) but has actual label: \(actualLabel)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility idenitifier and placeholder
    /// - Parameters:
    ///   - identifier: accessibility idenitifier
    ///   - withPlaceholder: text
    public func IShouldSeeTextField(_ identifier: String, withPlaceholder placeholder: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([placeholder, identifier]) {
            self.IWaitToSeeElement(identifier)
            let text = placeholder == "nothing" ? "" : placeholder
            let actualHolder = textFieldPlaceholder(for: identifier)
            XCTAssertTrue(self.textField(withIdentifier: identifier, hasPlaceholder: text), "\(identifier) text box expected placeholder: \(placeholder) has actual placeholder: \(actualHolder)", file: file, line: line)
        }
    }

    /// Verify UITextField exists with given accessibility idenitifier
    /// - Parameters:
    ///   - textFieldId: accessibility idenitifier
    public func IShouldSeeTextField(_ textFieldId: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldId]) {
            self.IWaitToSeeElement(textFieldId)
            XCTAssertTrue(self.textFieldExists(withIdentifier: textFieldId), "Text field with id \(textFieldId) not found", file: file, line: line)
        }
    }

    /// Verify UITextField with given accessibility idenitifier does not exist
    /// - Parameters:
    ///   - textFieldId: accessibility idenitifier
    public func IShouldNotSeeTextField(_ textFieldId: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldId]) {
            XCTAssertFalse(self.textFieldExists(withIdentifier: textFieldId), "Text field with id \(textFieldId) found", file: file, line: line)
        }
    }

    /// Verify UITextView with given accessibility idenitifier exists
    /// - Parameters:
    ///   - textFieldId: accessibility idenitifier
    public func IShouldSeeMultiLineTextField(_ textFieldId: String,
                                             file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldId]) {
            self.IWaitToSeeElement(textFieldId)
            XCTAssertTrue(self.multiLineTextFieldExists(withIdentifier: textFieldId), "Text field with id \(textFieldId) not found", file: file, line: line)
        }
    }

    /// Verify UITextView with given accessibility idenitifier does not exist
    /// - Parameters:
    ///   - textFieldId: accessibility idenitifier
    public func IShouldNotSeeMultiLineTextField(_ textFieldId: String,
                                                file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldId]) {
            XCTAssertFalse(self.multiLineTextFieldExists(withIdentifier: textFieldId), "Text field with id \(textFieldId) found", file: file, line: line)
        }
    }

    /// Verify UITextField with given accessibility idenitifier is either enabled or disabled based on enabled flag
    /// - Parameters:
    ///   - id: accessibility idenitifier
    ///   - isEnabled: boolean
    public func IShouldSeeTextField(_ id: String, isEnabled enabled: Bool,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, "\(enabled)"]) {
            self.IWaitToSeeElement(id)
            let textField = self.element(withIdentifier: id) as! UITextField
            if enabled {
                XCTAssertTrue(textField.isEnabled, "Text field \(id) is not enabled", file: file, line: line)
            } else {
                XCTAssertFalse(textField.isEnabled, "Text field \(id) is enabled", file: file, line: line)
            }
        }
    }

    /// Verify UITextField with given field name is either focused or not focused based on isFocused flag
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - isFocused: boolean
    public func IShouldSeeTextField(_ id: String, isFocused: Bool,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, String(isFocused)]) {
            if isFocused {
                XCTAssertTrue(self.textFieldIsFocused(withIdentifier: id), "Text field is not focused")
            } else {
                XCTAssertFalse(self.textFieldIsFocused(withIdentifier: id), "Text field is focused")
            }
        }
    }

    /// Verify UITextField with given field name is either focused or not focused based on isFocused flag
    /// - Parameters:
    ///   - withLabel: accessibility label
    ///   - isFocused: boolean
    public func IShouldSeeTextField(withLabel textFieldLabel: String, isFocused: Bool,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldLabel, String(isFocused)]) {
            if isFocused {
                XCTAssertTrue(self.textFieldIsFocused(withLabel: textFieldLabel), "Text field is not focused")
            } else {
                XCTAssertFalse(self.textFieldIsFocused(withLabel: textFieldLabel), "Text field is focused")
            }
        }
    }

    // TODO: Create test with this step
    /// Verify UITextField with given field name is either focused or not focused based on isFocused flag
    /// - Parameters:
    ///   - withFieldName: accessibility label of superview
    ///   - isFocused: boolean
    public func IShouldSeeTextField(withFieldName textFieldName: String, isFocused: Bool,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([textFieldName, String(isFocused)]) {
            if isFocused {
                XCTAssertTrue(self.textFieldIsFocused(withFieldName: textFieldName), "Text field is not focused")
            } else {
                XCTAssertFalse(self.textFieldIsFocused(withFieldName: textFieldName), "Text field is focused")
            }
        }
    }
}
