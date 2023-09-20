/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */
import XCTest

extension Steps {

    /// Verifies an Inline Edit exists with the given accessibility ID
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IShouldSeeInlineError(_ identifier: String,
                                      file: StaticString = #file,
                                      line: UInt = #line) {
        self.performStep([identifier]) {
            self.IWaitToSeeElement(identifier)
            XCTAssertTrue(self.uiLabelExists(withIdentifier: identifier),
                          "Inline error with \(identifier) does not exist",
                          file: file, line: line)
        }
    }

    /// Verifies an Inline Edit does not exists with the given accessibility ID
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IShouldNotSeeInlineError(_ identifier: String,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        self.performStep([identifier]) {
            XCTAssertFalse(self.uiLabelExists(withIdentifier: identifier),
                           "Inline error with \(identifier) should not exist",
                           file: file, line: line)
        }
    }

    /// Verifies an Inline Edit exists with the given accessibility ID and text
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withText: text of inline edit
    public func IShouldSeeInlineError(_ identifier: String,
                                      withText text: String,
                                      file: StaticString = #file,
                                      line: UInt = #line) {
        self.performStep([identifier, text]) {
            self.IWaitToSeeElement(identifier)
            let actualText = uiLabelText(for: identifier)
            XCTAssertTrue(self.uiLabel(withIdentifier: identifier,
                                       hasText: text),
                          "Expected text: \(text), Actual text: \(actualText)",
                          file: file,
                          line: line)
        }
    }

    /// Verifies an Inline Edit does not exists with the given accessibility ID and text
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - withText: text of inline edit
    public func IShouldNotSeeInlineError(_ identifier: String,
                                         withText text: String,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        self.performStep([identifier, text]) {
            XCTAssertFalse(self.uiLabel(withIdentifier: identifier,
                                        hasText: text),
                           "\(identifier) inline error should not have \(text)",
                           file: file,
                           line: line)
        }
    }

    /// Verifies an Inline Edit exists with the given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IShouldSeeInlineError(withLabel text: String,
                                      file: StaticString = #file,
                                      line: UInt = #line) {
        self.performStep([text]) {
            self.IWaitToSeeElement(withLabel: text)
            XCTAssertTrue(self.elementExists(withLabel: text),
                          "Inline error with \(text) does not exist",
                          file: file,
                          line: line)
        }
    }

    /// Verifies an Inline Edit does not exist with the given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IShouldNotSeeInlineError(withLabel text: String,
                                         file: StaticString = #file,
                                         line: UInt = #line) {
        self.performStep([text]) {
            XCTAssertTrue(self.elementDoesNotExist(withLabel: text),
                          "Inline error with \(text) should not exist",
                          file: file,
                          line: line)
        }
    }

    /// Verifies a Inline Edt exists with the given accessibility ID and contains text
    /// - Parameters:
    ///   - identifier: accessibility identifier
    ///   - containingText: text of inline edit
    public func IShouldSeeInlineError(_ identifier: String,
                                      containingText text: String,
                                      file: StaticString = #file,
                                      line: UInt = #line) {
        self.performStep([identifier, text]) {
            self.IWaitToSeeElement(identifier)
            XCTAssertTrue(self.uiLabel(withIdentifier: identifier,
                                       containsText: text),
                          "\(identifier) inline error does not contain \(text)",
                          file: file,
                          line: line)
        }
    }
}
