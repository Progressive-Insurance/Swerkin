/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Verified element exists with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IShouldSeeElement(withLabel label: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.IWaitToSeeElement(withLabel: label)
        }
    }

    /// Verified element exists with accessibility label that starts with text
    /// - Parameters:
    ///   - startsWithLabel: partial accessibility label
    public func IShouldSeeElement(startsWithLabel labelPrefix: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([labelPrefix]) {
            self.IWaitToSeeElement(withLabelPrefix: labelPrefix)
        }
    }

    /// Verified element exists with accessibility label that ends with text
    /// - Parameters:
    ///   - endsWithLabel: partial accessibility label
    public func IShouldSeeElement(endsWithLabel labelSuffix: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([labelSuffix]) {
            self.IWaitToSeeElement(withLabelSuffix: labelSuffix)
        }
    }

    /// Verified element exists with accessibility label that contains text
    /// - Parameters:
    ///   - withPartialLabel: partial accessibility label
    public func IShouldSeeElement(withPartialLabel partialLabel: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([partialLabel]) {
            self.IWaitToSeeElement(withPartialLabel: partialLabel)
        }
    }

    /// Verified element exists with accessibility label that matches pattern
    /// - Parameters:
    ///   - withLabelMatchingPattern: regular expression
    public func IShouldSeeElement(withLabelMatchingPattern pattern: String,
                                  file: StaticString = #file, line: UInt = #line) {
        performStep([pattern]) {
            self.testCase.waiting(for: self.elementExists(withLabelMatchingPattern: pattern), errorMessage: "Did not find label matching pattern \(pattern)", file: file, line: line)

        }
    }

    /// Verified element with accessibility value exists
    /// - Parameters:
    ///   - containingValue: accessibility value
    public func IShouldSeeElement(containingValue value: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            self.IWaitToSeeElement(withValue: value)
        }
    }

    /// Verified element with accessibility value does not exist
    /// - Parameters:
    ///   - containingValue: accessibility value
    public func IShouldNotSeeElement(containingValue value: String,
                                     file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            let found = self.test.viewTester().view(withValue: value)
            XCTAssertTrue(found == nil, "Found view containing text \(value)", file: file, line: line)
        }
    }

    /// Verified element with given accessibility label does not exist
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IShouldNotSeeElement(withLabel text: String,
                                     file: StaticString = #file, line: UInt = #line) {
        self.performStep([text]) {
            XCTAssertTrue(self.elementDoesNotExist(withLabel: text), "Element with label \(text) exists", file: file, line: line)
        }
    }

    /// Verified element with given accessibility label does not display
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IShouldNotBeAbleToSeeElement(withLabel text: String,
                                             file: StaticString = #file, line: UInt = #line) {
        self.performStep([text]) {
            XCTAssertTrue(self.elementDoesNotDisplay(withLabel: text), "Element with label \(text) exists", file: file, line: line)
        }
    }

    /// Verify element with given accessibility label is not touchable
    /// - Parameters:
    ///   - withText: accessibility label
    public func IShouldNotBeAbleToTouchElement(withText text: String,
                                               file: StaticString = #file, line: UInt = #line) {
        self.performStep([text]) {
            XCTAssertFalse(self.elementIsTappable(withLabel: text), "Element with label \(text) is tappable", file: file, line: line)
        }
    }

    /// Verify element with given accessibility label is touchable
    /// - Parameters:
    ///   - withText: accessibility label
    public func IShouldBeAbleToTouchElement(withText text: String,
                                            file: StaticString = #file, line: UInt = #line) {
        self.performStep([text]) {
            self.IWaitToSeeElement(withLabel: text)
            XCTAssertTrue(self.elementIsTappable(withLabel: text), "Element with label \(text) is tappable", file: file, line: line)
        }
    }
}
