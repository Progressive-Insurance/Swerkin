/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import KIF


extension Steps: Touchable {

    public func touchView(withIdentifier id: String? = nil, withLabel label: String? = nil,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        if let id = id {
            waitForElement(withIdentifier: id, file: file, line: line)
        } else if let label = label {
            waitForElement(withLabel: label, file: file, line: line)
        }

        if let id = id {
            viewTester.usingIdentifier(id).waitForTappableView()
            viewTester.usingIdentifier(id).tap()
        } else if let label = label {
            viewTester.usingLabel(label).waitForTappableView()
            viewTester.usingLabel(label).tap()
        }
    }

    public func longPressView(withIdentifier id: String? = nil, withLabel label: String? = nil,
                              file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        if let id = id {
            waitForElement(withIdentifier: id, file: file, line: line)
        } else if let label = label {
            waitForElement(withLabel: label, file: file, line: line)
        }

        if let id = id {
            viewTester.usingIdentifier(id).waitForTappableView()
            viewTester.usingIdentifier(id).longPress()
        } else if let label = label {
            viewTester.usingLabel(label).waitForTappableView()
            viewTester.usingLabel(label).longPress()
        }
    }

    public func touchButton(withIdentifier id: String? = nil, withLabel label: String? = nil, file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        if let id = id {
            waitForElement(withIdentifier: id, file: file, line: line)
        } else if let label = label {
            waitForElement(withLabel: label, file: file, line: line)
        }

        guard let _: UIButton = viewTester.button(withIdentifier: id, withLabel: label) else {
            if let id = id {
                self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find button with id: \(id)"))
            }
            if let label = label {
                self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find button with label: \(label)"))
            }
            return
        }

        if let id = id {
            viewTester.usingIdentifier(id).waitForTappableView()
            viewTester.usingIdentifier(id).tap()
        } else if let label = label {
            viewTester.usingLabel(label).waitForTappableView()
            viewTester.usingLabel(label).tap()
        }
    }

    public func swipe(direction: KIFSwipeDirection, file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "SELF isKindOfClass:%@", argumentArray: [UIScrollView.self])
        let viewTester = self.test.viewTester()
        self.testCase.waiting(for: viewTester.view(withPredicate: predicate) != nil, errorMessage: "Did not find scrollable", file: file, line: line)

        viewTester.usingPredicate(predicate).swipe(in: direction)
    }

    public func swipeOn(identifier: String, direction: KIFSwipeDirection, file: StaticString = #file, line: UInt = #line) {
        let predicate = NSPredicate(format: "SELF isKindOfClass:%@", argumentArray: [UIScrollView.self])
        let viewTester = self.test.viewTester()
        self.testCase.waiting(for: viewTester.view(withPredicate: predicate) != nil, errorMessage: "Did not find scrollable", file: file, line: line)
        waitForElement(withIdentifier: identifier, file: file, line: line)

        viewTester.usingPredicate(predicate).usingIdentifier(identifier).swipe(in: direction)
    }

    public func setSwitch(withIdentifier id: String, to switchIsOn: Bool, file: StaticString = #file, line: UInt = #line) {
        let viewTester = self.test.viewTester()
        waitForElement(withIdentifier: id)
        viewTester.usingIdentifier(id).waitForTappableView()
        viewTester.usingIdentifier(id)?.setSwitchOn(switchIsOn)
    }

    public func touchTextField(withIdentifier id: String? = nil, withLabel label: String? = nil,
                               file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withIdentifier: id, withLabel: label) else {
            if let id = id { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(id)")) }
            if let label = label { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with label: \(label)")) }
            return
        }

        if let id = id {
            viewTester.usingIdentifier(id).waitForTappableView()
            viewTester.usingIdentifier(id).tap()
        } else if let label = label {
            viewTester.usingLabel(label).waitForTappableView()
            viewTester.usingLabel(label).tap()
        }
    }

    public func clearText(from id: String? = nil, fromFieldWithLabel label: String? = nil,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withIdentifier: id, withLabel: label) else {
            if let id = id { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(id)")) }
            if let label = label { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with label: \(label)")) }
            return
        }

        if let id = id { viewTester.usingIdentifier(id).clearText() }
        if let label = label { viewTester.usingLabel(label).clearText() }
    }

    public func touchTextField(withId id: String? = nil, withValue val: String? = nil,
                               file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withId: id, withValue: val) else {
            if let id = id { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(id)")) }
            if let val = val { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with value: \(val)")) }
            return
        }

        if let id = id {
            viewTester.usingIdentifier(id).waitForTappableView()
            viewTester.usingIdentifier(id).tap()
        } else if let val = val {
            viewTester.usingValue(val).waitForTappableView()
            viewTester.usingValue(val).tap()
        }
    }

    public func clearText(fromId id: String? = nil, fromFieldWithValue val: String? = nil,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withId: id, withValue: val) else {
            if let id = id { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(id)")) }
            if let val = val { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with value: \(val)")) }
            return
        }

        if let id = id { viewTester.usingIdentifier(id).clearText() }
        if let val = val { viewTester.usingValue(val).clearText() }
    }

    public func touchTextField(withFieldName label: String,
                               file: StaticString = #file, line: UInt = #line) {
        let viewTester = self.test.viewTester()

        if let _: UITextField = viewTester.textField(withFieldLabel: label) {
            self.touchView(withLabel: label)
        } else {
            XCTFail("Not a text field")
        }
    }

    public func clearMultiLineText(from id: String? = nil, fromFieldWithValue val: String? = nil,
                                   file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextView = viewTester.multiLineTextField(withIdentifier: id, withValue: val) else {
            if let id = id { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(id)")) }
            if let val = val { self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with value: \(val)")) }
            return
        }

        if let id = id { viewTester.usingIdentifier(id).clearText() }
        if let val = val { viewTester.usingValue(val).clearText() }
    }

    public func enterText(intoElement identifier: String, withText text: String,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()
        viewTester.usingIdentifier(identifier).waitForTappableView()
        viewTester.validateEnteredText(false)
        viewTester.usingIdentifier(identifier).clearAndEnterText(text)
    }

    public func enterText(intoElementWithLabel label: String, withText text: String,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()
        viewTester.usingLabel(label).waitForTappableView()
        viewTester.validateEnteredText(false)
        viewTester.usingLabel(label).clearAndEnterText(text)
    }

    public func enterText(into identifier: String, withText text: String,
                          file: StaticString = #file, line: UInt = #line) {

        guard let _: UITextField = self.test.viewTester().textField(withIdentifier: identifier) else {
            self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(identifier)"))
            return
        }

        self.enterText(intoElement: identifier, withText: text, file: file, line: line)
    }

    public func enterMultiLineText(into identifier: String, withText text: String,
                                   file: StaticString = #file, line: UInt = #line) {

        guard let _: UITextView = self.test.viewTester().multiLineTextField(withIdentifier: identifier) else {
            self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(identifier)"))
            return
        }

        self.enterText(intoElement: identifier, withText: text, file: file, line: line)
    }

    public func enterText(into identifier: String, withText text: String, andExpect expected: String,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withIdentifier: identifier) else {
            self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with id: \(identifier)"))
            return
        }

        viewTester.usingIdentifier(identifier).waitForTappableView()
        viewTester.validateEnteredText(true)
        viewTester.usingIdentifier(identifier).clearAndEnterText(text, expectedResult: expected)
    }

    public func enterText(intoFieldWithValue val: String, withText text: String,
                          file: StaticString = #file, line: UInt = #line) {

        let viewTester = self.test.viewTester()

        guard let _: UITextField = viewTester.textField(withValue: val) else {
            self.test.record(XCTIssue(type: .assertionFailure, compactDescription: "Cannot find text field with value: \(val)"))
            return
        }

        viewTester.usingValue(val).waitForTappableView()
        viewTester.validateEnteredText(false)
        viewTester.usingValue(val).clearAndEnterText(text)
    }

    public func enterText(intoFieldWithName label: String, withText text: String,
                          file: StaticString = #file, line: UInt = #line) {
        let viewTester = self.test.viewTester()
        let textField = viewTester.textField(withFieldLabel: label)
        viewTester.usingIdentifier(textField?.accessibilityIdentifier).enterText(text)
    }

    public func select(dropDownValue text: String,
                       file: StaticString = #file, line: UInt = #line) {
        self.test.viewTester().selectPickerViewRow(withTitle: text)
    }

    public func select(dropDownValue text: String, inComponent component: Int,
                       file: StaticString = #file, line: UInt = #line) {
        self.viewTester.selectPickerViewRow(withTitle: text, inComponent: component)
    }

    public func touchTableCell(withLabel tableCellName: String,
                               file: StaticString = #file, line: UInt = #line) {
        if let _: UITableViewCell = self.viewTester.tableCell(withLabel: tableCellName) {
            self.touchView(withLabel: tableCellName)
        } else {
            XCTFail("Not a table cell field")
        }
    }
}
