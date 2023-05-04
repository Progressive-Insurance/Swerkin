/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

public protocol Touchable: ElementTouchable, SwitchTouchable, TextFieldTouchable, ButtonTouchable, DropDownTouchable, TableCellTouchable { }

public protocol ElementTouchable {
    func touchView(withIdentifier id: String?, withLabel label: String?, file: StaticString, line: UInt)
    func longPressView(withIdentifier id: String?, withLabel label: String?, file: StaticString, line: UInt)
    func swipe(direction: KIFSwipeDirection, file: StaticString, line: UInt)
    func swipeOn(identifier: String, direction: KIFSwipeDirection, file: StaticString, line: UInt)
}

public protocol SwitchTouchable {
    func setSwitch(withIdentifier id: String, to switchIsOn: Bool, file: StaticString, line: UInt)
}

public protocol ButtonTouchable {
    func touchButton(withIdentifier id: String?, withLabel label: String?, file: StaticString, line: UInt)
}

public protocol TextFieldTouchable {
    func touchTextField(withIdentifier id: String?, withLabel label: String?, file: StaticString, line: UInt)
    func clearText(from id: String?, fromFieldWithLabel label: String?, file: StaticString, line: UInt)
    func touchTextField(withId id: String?, withValue val: String?, file: StaticString, line: UInt)
    func clearText(fromId id: String?, fromFieldWithValue val: String?, file: StaticString, line: UInt)
    func touchTextField(withFieldName label: String, file: StaticString, line: UInt)
    func clearMultiLineText(from id: String?, fromFieldWithValue val: String?, file: StaticString, line: UInt)
    func enterText(intoElement identifier: String, withText text: String, file: StaticString, line: UInt)
    func enterText(intoElementWithLabel label: String, withText text: String, file: StaticString, line: UInt)
    func enterText(into identifier: String, withText text: String, file: StaticString, line: UInt)
    func enterMultiLineText(into identifier: String, withText text: String, file: StaticString, line: UInt)
    func enterText(into identifier: String, withText text: String, andExpect expected: String, file: StaticString, line: UInt)
    func enterText(intoFieldWithValue val: String, withText text: String, file: StaticString, line: UInt)
    func enterText(intoFieldWithName label: String, withText text: String, file: StaticString, line: UInt)
}

public protocol DropDownTouchable {
    func select(dropDownValue text: String, file: StaticString, line: UInt)
    func select(dropDownValue text: String, inComponent component: Int, file: StaticString, line: UInt)
}

public protocol TableCellTouchable {
    func touchTableCell(withLabel tableCellName: String, file: StaticString, line: UInt)
}
