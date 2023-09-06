/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import CoreFoundation
import CoreGraphics

extension Steps {

    /// Touch text box with a given accessibility identifier
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func ITouchTextBox(_ identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.touchTextField(withIdentifier: identifier, file: file, line: line)
        }
    }

    /// Touch text box with a given accessibility value
    /// - Parameters:
    ///   - withValue: accessibility value
    public func ITouchTextBox(withValue value: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            self.touchTextField(withValue: value, file: file, line: line)
        }
    }

    // TODO: Create test with this step
    /// Touch text box with a given field name
    /// - Parameters:
    ///   - withFieldName: accessibility label of superview
    public func ITouchTextBox(withFieldName textFieldName: String) {
        self.touchTextField(withFieldName: textFieldName)
    }

    /// Enter text into a UITextField with a given accessibility identifier and then dismiss the keyboard based on dismiss flag
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - andDismissKeyboard: boolean flag, true dismisses keyboard, false (default) does not
    public func IEnterIntoTextField(_ id: String, text: String, andDismissKeyboard dismiss: Bool=false,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            self.enterText(into: id, withText: text, file: file, line: line)
            if dismiss {
                IDismissKeyboard()
            }
        }
    }

    /// Enter text into a UITextView with a given accessibility identifier and then dismiss the keyboard based on dismiss flag
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - andDismissKeyboard: boolean flag, true dismisses keyboard, false (default) does not
    public func IEnterIntoMultiLineTextField(_ id: String, text: String, andDismissKeyboard dismiss: Bool=false,
                                             file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            self.enterMultiLineText(into: id, withText: text, file: file, line: line)
            if dismiss {
                IDismissKeyboard()
            }
        }
    }

    /// Enter text into a UIElement with a given accessibility identifier and then dismiss the keyboard based on dismiss flag
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - andDismissKeyboard: boolean flag, true dismisses keyboard, false (default) does not
    public func IEnterIntoElement(_ id: String, text: String, andDismissKeyboard dismiss: Bool=false,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            self.enterText(intoElement: id, withText: text, file: file, line: line)
            if dismiss {
                IDismissKeyboard()
            }
        }
    }

    /// Enter text into a UIElement with a given accessibility label and then dismiss the keyboard based on dismiss flag
    /// - Parameters:
    ///   - withLabel: accessibility label
    ///   - text: text to enter
    ///   - andDismissKeyboard: boolean flag, true dismisses keyboard, false (default) does not
    public func IEnterIntoElement(withLabel label: String, text: String, andDismissKeyboard dismiss: Bool=false,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, label]) {
            self.enterText(intoElementWithLabel: label, withText: text, file: file, line: line)
            if dismiss {
                IDismissKeyboard()
            }
        }
    }

    /// Enter text into a text field with a given accessibility value
    /// - Parameters:
    ///   - withValue: accessibility value
    ///   - text: text to enter
    public func IEnterIntoTextField(withValue value: String, text: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, value]) {
            self.enterText(intoFieldWithValue: value, withText: text, file: file, line: line)
        }
    }

    // TODO: Create test with this step
    /// Enter text into a UITextField with a given field name and then dismiss the keyboard based on dismiss flag
    /// - Parameters:
    ///   - textFieldName: accessibility label of superview
    ///   - text: text to enter
    public func IEnterIntoTextField(withFieldName textFieldName: String, text: String) {
        self.performStep {
            self.enterText(intoFieldWithName: textFieldName, withText: text)
        }
    }

    /// Enter text into a text field with a given accessibility identifier and touch a button bar button with a given accessibility label
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - buttonText: accessibility label of the button bar button
    public func IEnterIntoTextFieldAndTouchButton(_ id: String, text: String, buttonText: String = "Done",
                                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            self.enterText(into: id, withText: text, file: file, line: line)
            self.ITouchButtonBarButton(withLabel: buttonText)
        }
    }

    /// Enter text into a text field with a given accessibility identifier and verify the expect value of the text in the text field
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - expectText: expected text to be displayed in the field after being entered
    public func IEnterIntoTextField(_ id: String, text: String, andExpect expectText: String,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            self.enterText(into: id, withText: text, andExpect: expectText, file: file, line: line)
        }
    }

    /// Clear UITextField with a given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    public func IClearTextField(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.clearText(from: id, file: file, line: line)
        }
    }

    /// Clear UITextView with a given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    public func IClearMultiLineTextField(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.clearMultiLineText(from: id, file: file, line: line)
        }
    }

    /// Clear text field with a given accessibility value
    /// - Parameters:
    ///   - withValue: accessibility value
    public func IClearTextField(withValue value: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            self.clearText(fromFieldWithValue: value, file: file, line: line)
        }
    }

    /// Touch text field with a given accessibility identifier and leave it empty
    /// - Parameters:
    ///   - id: accessibility identifier
    public func ILeaveEmptyTextField(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }

    /// Touch text field with a given accessibility value and leave it empty
    /// - Parameters:
    ///   - withValue: accessibility value
    public func ILeaveEmptyTextField(withValue value: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            self.touchTextField(withValue: value, file: file, line: line)
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }

    /// Enter text into a text field with a given accessibility identifier a given number of times and then verify that it displays that number of times in the text field
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - text: text to enter
    ///   - numberOfTimes: number of times to enter the text
    ///   - andSeeItNumberOfTimes: number of times the entered text should display in the text field
    public func IEnterIntoTextField(_ id: String, text: String,
                                    numberOfTimes times: Int, andSeeItNumberOfTimes expectedTimes: Int,
                                    file: StaticString = #file, line: UInt = #line) {
        self.performStep([text, id]) {
            let actual = String(repeating: text, count: times)
            let expected = String(repeating: text, count: expectedTimes)
            self.enterText(into: id, withText: actual, andExpect: expected, file: file, line: line)
        }
    }

    /// Dismiss keyboard by touching outside the keyboard zone on the screen
    public func IDismissKeyboard() {
        self.viewTester.tapScreen(at: CGPoint(x: 10, y: 100))
        self.waitForAbsenceOfSoftwareKeyboard()
    }
}
