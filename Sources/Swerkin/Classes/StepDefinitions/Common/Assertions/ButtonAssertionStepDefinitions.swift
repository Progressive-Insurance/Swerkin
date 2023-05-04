/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Verifies a UIButton exists with the given accessibility ID
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    public func IShouldSeeButton(_ buttonId: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId]) {
            self.IWaitToSeeElement(buttonId)
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) not found", file: file, line: line)
        }
    }

    /// Verifies a UIButton exists with the given accessibility label
    /// - Parameters:
    ///   - buttonLabel: Button accessibiliity label
    public func IShouldSeeButton(withLabel buttonLabel: String,
                                 file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonLabel]) {
            self.IWaitToSeeElement(withLabel: buttonLabel)
            XCTAssertTrue(self.buttonExists(withLabel: buttonLabel), "Button with label \(buttonLabel) not found", file: file, line: line)
        }
    }

    /// Verifies a UIButton exists with the given accessibility idenitifier and label
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    ///   - buttonLabel: Button accessibility label
    public func IShouldSeeButton(_ buttonId: String, withLabel buttonLabel: String,
                                 file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId, buttonLabel]) {
            self.IWaitToSeeElement(buttonId)
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) not found", file: file, line: line)
            guard let label = self.element(withIdentifier: buttonId)?.accessibilityLabel else {
                XCTFail("\(buttonId) had no accessibilityLabel")
                return
            }
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId, withLabel: buttonLabel), "Button \(buttonId) with expected label \(buttonLabel) had actual label: \(label)", file: file, line: line)
        }
    }

    /// Verifies a UIButton exists with the given accessibility idenitifier and contains a text value
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    ///   - text: Text value that the button should contain
    public func IShouldSeeButton(_ buttonId: String, containsText text: String,
                                 file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId, text]) {
            self.IWaitToSeeElement(buttonId)
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) not found", file: file, line: line)

            let textValue = text == "nothing" ? "" : text
            let actualText = uiButtonText(for: buttonId)
            XCTAssertTrue(self.uiButton(withIdentifier: buttonId, containsText: textValue), "Button \(buttonId) with expected text \(textValue) had actual text: \(actualText)", file: file, line: line)
        }
    }

    /// Verifies a UIButton with a given accessibility identifier does not exist
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    public func IShouldNotSeeButton(_ buttonId: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId]) {
            XCTAssertFalse(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) should not exist", file: file, line: line)
        }
    }

    /// Verifiies a UIButton with a given accessibility identifier is either enabled or disabled based on enabled flag
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    ///   - enabled: Boolean flag to either verify button is tappable or is not tappable
    public func IShouldSeeButton(_ buttonId: String, isEnabled enabled: Bool,
                                 file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId, "\(enabled)"]) {
            self.IWaitToSeeElement(buttonId)
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) not found", file: file, line: line)
            if enabled {
                XCTAssertTrue(self.elementIsTappable(withIdentifier: buttonId), "Button with id \(buttonId) is disabled", file: file, line: line)
            } else {
                XCTAssertFalse(self.elementIsTappable(withIdentifier: buttonId), "Button with id \(buttonId) is enabled", file: file, line: line)
            }
        }
    }

    /// Verifiies a UIButton with a given accessibility label is either enabled or disabled based on enabled flag
    /// - Parameters:
    ///   - buttonId: Button accessibiliity label
    ///   - enabled: Boolean flag to either verify button is tappable or is not tappable
    public func IShouldSeeButton(withLabel buttonName: String, isEnabled enabled: Bool) {
        guard let _: UIButton = self.viewTester.button(withLabel: buttonName) else {
            XCTFail("Element with label: \(buttonName) is not a button")
            return
        }
        if enabled {
            XCTAssertFalse(self.elementIsNotEnabled(withLabel: buttonName), "Button: \(buttonName) is not enabled")
        } else {
            XCTAssertTrue(self.elementIsNotEnabled(withLabel: buttonName), "Button: \(buttonName) is enabled")
        }
    }

    /// Verifiies a UIButton with a given accessibility identifier is either highlighted or not based on highlighted flag
    /// - Parameters:
    ///   - buttonId: Button accessibiliity ID
    ///   - highlighted: Boolean flag to either verify button is highlighted or not
    public func IShouldSeeButton(_ buttonId: String, isHighlighted highlighted: Bool,
                                 file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId, "\(highlighted)"]) {
            self.IWaitToSeeElement(buttonId)
            XCTAssertTrue(self.buttonExists(withIdentifier: buttonId), "Button with id \(buttonId) not found", file: file, line: line)
            XCTAssertTrue(self.checkButtonHighlighted(withIdentifier: buttonId), "Button was not highlighted", file: file, line: line)
        }
    }

    private func checkButtonHighlighted(withIdentifier id: String) -> Bool {
        if let view = self.element(withIdentifier: id) {
            for subview in view.subviews {
                if let image = subview as? UIImageView {
                    if image.isHighlighted {
                        return true
                    }
                }
            }
        }
        return false
    }
}
