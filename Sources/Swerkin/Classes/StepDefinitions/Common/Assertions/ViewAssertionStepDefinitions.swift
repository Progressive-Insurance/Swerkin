/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit
import XCTest

extension Steps {

    /// Verify element with given accessibility identifier exists
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IShouldSeeElement(_ identifier: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.IWaitToSeeElement(identifier)
            XCTAssertTrue(self.elementExists(withIdentifier: identifier), "Element with \(identifier) does not exist", file: file, line: line)
        }
    }

    /// Verify element with given accessibility identifier does not exist
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IShouldNotSeeElement(_ identifier: String,
                                     file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            XCTAssertFalse(self.elementExists(withIdentifier: identifier), "Element with \(identifier) should not exist", file: file, line: line)
        }
    }

    /// Verify image with given accessibility identifier exists
    /// - Parameters:
    ///   - id: accessibility identifier
    public func IShouldSeeImage(_ id: String,
                                file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.IWaitToSeeElement(id)
            XCTAssertTrue(self.imageExists(withIdentifier: id), "Image with identifier \(id) not found", file: file, line: line)
        }
    }

    /// Verify image with given accessibility identifier does not exist
    /// - Parameters:
    ///   - id: accessibility identifier
    public func IShouldNotSeeImage(_ id: String,
                                   file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            XCTAssertFalse(self.imageExists(withIdentifier: id), "Image with identifier \(id) found", file: file, line: line)
        }
    }

    /// Verify image with given accessibility identifier and accessibility label exists
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withLabel: accessibility label
    public func IShouldSeeImage(_ id: String, withLabel label: String,
                                file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, label]) {
            self.IWaitToSeeElement(id)
            let textValue = label == "nothing" ? "" : label
            let found = self.imageExists(withIdentifier: id, withLabel: textValue)
            if !found {
                self.recordLabelFailure(for: id, withExpectedLabel: label, file: file, line: line)
            }
        }
    }

    /// Verify element with given accessibility identifier and accessibility label exists
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withLabel: accessibility label
    public func IShouldSeeElement(_ identifier: String, withLabel label: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier, label]) {
            self.IWaitToSeeElement(identifier)
            let textValue = label == "nothing" ? "" : label
            let found = self.elementExists(withIdentifier: identifier, withLabel: textValue)
            if !found {
                self.recordLabelFailure(for: identifier, withExpectedLabel: label, file: file, line: line)
            }
        }
    }

    /// Verify element with given accessibility identifier exists with partial accessibility label
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withPartialLabel: partial accessibility label
    public func IShouldSeeElement(_ id: String, withPartialLabel partLabel: String,
                                  file: StaticString = #file, line: UInt = #line) {
        performStep([id, partLabel]) {
            self.IWaitToSeeElement(id)
            guard let label = self.element(withIdentifier: id)?.accessibilityLabel else {
                XCTFail("\(id) has no accessibilityLabel")
                return
            }
            XCTAssertTrue(label.contains(partLabel), "Element \(id) does not contain \(partLabel) in the actual label: \(label)")
        }
    }

    /// Verify element with given accessibility identifier exists with accessibility matching pattern
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withLabelMatchingPattern: regular expression
    public func IShouldSeeElement(_ id: String, withLabelMatchingPattern pattern: String,
                                  file: StaticString = #file, line: UInt = #line) {
        performStep([id, pattern]) {
            self.IWaitToSeeElement(id)
            guard let label = self.element(withIdentifier: id)?.accessibilityLabel else {
                XCTFail("\(id) has no accessibilityLabel")
                return
            }
            self.testCase.waiting(for: self.elementExists(withLabelMatchingPattern: pattern), errorMessage: "Element \(id) with expected pattern \(pattern) in label was not found in actual label: \(label)", file: file, line: line)
        }
    }

    /// Verify element with given accessibility identifier exists with accessibility trait
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withTrait: accessibility trait
    public func IShouldSeeElement(_ identifier: String, withTrait trait: UIAccessibilityTraits,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier, "\(trait)"]) {
            self.IWaitToSeeElement(identifier)
            XCTAssertTrue(self.elementExists(withIdentifier: identifier, withTrait: trait), "\(identifier) element does not contain trait \(trait)", file: file, line: line)
        }
    }

    /// Verify element with given accessibility identifier exists with accessibility value
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withValue: accessibility value
    public func IShouldSeeElement(_ identifier: String, withValue value: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier, value]) {
            self.IWaitToSeeElement(identifier)
            let textValue = value == "nothing" ? "" : value
            let found = self.elementExists(withIdentifier: identifier, withValue: textValue)
            if !found {
                self.recordValueFailure(for: identifier, withExpectedValue: value, file: file, line: line)
            }
        }
    }

    /// Verify UILabel with given accessibility identifier exists with text value
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withText: text
    public func IShouldSeeLabel(_ id: String, withText text: String,
                                file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, text]) {
            self.IWaitToSeeElement(id)
            let textValue = text == "nothing" ? "" : text
            let actualText = uiLabelText(for: id)
            XCTAssertTrue(self.uiLabel(withIdentifier: id, hasText: textValue), "\(id) label does not expected text: \(text) but had actual text: \(actualText)", file: file, line: line)
        }
    }

    /// Verify UILabel with given accessibility identifier exists contains text
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - containingText: text
    public func IShouldSeeLabel(_ id: String, containingText text: String,
                                file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, text]) {
            self.IWaitToSeeElement(id)
            let textValue = text == "nothing" ? "" : text
            let actualText = uiLabelText(for: id)
            XCTAssertTrue(self.uiLabel(withIdentifier: id, containsText: textValue), "\(id) label with actual text: \(actualText) does not contain expected text: \(text)", file: file, line: line)
        }
    }

    private func recordLabelFailure(for identifier: String, withExpectedLabel label: String, file: StaticString, line: UInt) {
        guard let element = self.element(withIdentifier: identifier) else {
            XCTFail("Element \(identifier) was not found", file: file, line: line)
            return
        }
        let actualValues = self.allLabels(for: element)
        guard !actualValues.isEmpty else {
            XCTFail("Element \(identifier) has no accessibilityLabels", file: file, line: line)
            return
        }
        XCTFail("Element \(identifier) with expected label: \(label) has actual labels: \(actualValues.joined(separator: " | "))", file: file, line: line)
    }

    private func recordValueFailure(for identifier: String, withExpectedValue value: String, file: StaticString, line: UInt) {
        guard let element = self.element(withIdentifier: identifier) else {
            XCTFail("Element \(identifier) was not found", file: file, line: line)
            return
        }
        let actualValues = self.allValues(for: element)
        guard !actualValues.isEmpty else {
            XCTFail("Element \(identifier) has no accessibilityValues", file: file, line: line)
            return
        }
        XCTFail("Element \(identifier) with expected value: \(value) has actual values: \(actualValues.joined(separator: " | "))", file: file, line: line)
    }

}
