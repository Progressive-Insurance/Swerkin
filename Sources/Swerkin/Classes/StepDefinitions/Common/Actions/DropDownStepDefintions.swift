/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Select item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - item: drop down item
    public func ISelectFromDropDown(_ id: String, item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, id]) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.select(dropDownValue: item)
        }
    }

    /// Select item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - item: drop down item
    public func ISetDropDown(_ id: String, toValue item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, id]) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.viewTester.usingIdentifier(id).setText(item)
            ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select multple items from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - items: list of drop down item
    public func ISelectFromDropDown(_ id: String, items: [String], file: StaticString = #file, line: UInt = #line) {
        var values = items
        values.append(id)
        self.performStep(values) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.waitForSoftwareKeyboard()
            for (index, item) in items.enumerated() {
                self.select(dropDownValue: item, inComponent: index)
            }
        }
    }

    /// Select item from drop down with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    ///   - item: drop down item
    public func ISelectFromDropDown(withLabel label: String, item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, label]) {
            self.touchTextField(withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.select(dropDownValue: item)
        }
    }

    /// Select item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - label: accessibility label
    ///   - item: drop down item
    public func ISetDropDown(withLabel label: String, toValue item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, label]) {
            self.touchTextField(withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.viewTester.usingLabel(label).setText(item)
            ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select item from drop down with given accessibility value
    /// - Parameters:
    ///   - withValue: accessibility value
    ///   - item: drop down item
    public func ISelectFromDropDown(withValue value: String, item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, value]) {
            self.touchTextField(withValue: value, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.select(dropDownValue: item)
        }
    }

    /// Select item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - value: accessibility value
    ///   - item: drop down item
    public func ISetDropDown(withValue value: String, toValue item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, value]) {
            self.touchTextField(withValue: value, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.viewTester.usingValue(value).setText(item)
            ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select item from drop down with given accessibility identifier and accessibility label
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withLabel: accessibility value
    ///   - item: drop down item
    public func ISelectFromDropDown(_ id: String, withLabel label: String, item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, id, label]) {
            self.touchTextField(withIdentifier: id, withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.select(dropDownValue: item)
        }
    }

    /// Select item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - item: drop down item
    public func ISetDropDown(_ id: String, withLabel label: String, toValue item: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([item, id, label]) {
            self.touchTextField(withIdentifier: id, withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.viewTester.usingIdentifier(id).usingLabel(label).setText(item)
            ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select default item from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    public func ISelectDefaultValueFromDropDown(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }

    /// Select default item from drop down with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func ISelectDefaultValueFromDropDown(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.touchTextField(withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }

    /// Select nothing from drop down with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    public func ISelectEmptyValueFromDropDown(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.touchTextField(withIdentifier: id, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select nothing from drop down with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func ISelectEmptyValueFromDropDown(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.touchTextField(withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Cancel")
        }
    }

    /// Select default item from drop down with given accessibility id and accessibility label
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withLabel: accessibility label
    public func ISelectDefaultValueFromDropDown(_ id: String, withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, label]) {
            self.touchTextField(withIdentifier: id, withLabel: label, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }

    /// Select default item from drop down with given accessibility id and accessibility value
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - withValue: accessibility value
    public func ISelectDefaultValueFromDropDown(_ id: String, withValue value: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id, value]) {
            self.touchTextField(withId: id, withValue: value, file: file, line: line)
            self.waitForSoftwareKeyboard()
            self.ITouchButtonBarButton(withLabel: "Done")
        }
    }
}
