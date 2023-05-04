/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

public class ExampleScreenProvider: ScreenProvider<ExamplePresentableScreen> {
    public var testReference: BaseTestCase! = nil

    public required init(testCase: BaseTestCase?) {
        self.testReference = testCase
    }
    
    public override func screen(for screen: ExamplePresentableScreen) -> Screen? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen(testCase: self.testReference)
        case .dropDownScreen:
           return DropdownScreen(testCase: testReference)
        case .endToEndScreen:
            return EndToEndScreen(testCase: testReference)
        case .homeScreen:
           return HomeScreen(testCase: testReference)
        case .swipeScreen:
            return SwipeScreen(testCase: testReference)
        case .tappableScreen:
            return TappableScreen(testCase: testReference)
        case .textFieldScreen:
            return TextFieldScreen(testCase: testReference)
        case .waitToSeeScreen:
            return WaitToSeeScreen(testCase: testReference)
        case .tableViewScreen:
            return TableViewScreen(testCase: testReference)
            
        }
    }

    public override func typeMarker(for screen: ExamplePresentableScreen) -> Screen.Type? {
        switch screen {
        case .buttonScreen:
            return ButtonScreen.self
        case .dropDownScreen:
            return DropdownScreen.self
        case .endToEndScreen:
            return EndToEndScreen.self
        case .homeScreen:
            return HomeScreen.self
        case .swipeScreen:
            return SwipeScreen.self
        case .tappableScreen:
            return TappableScreen.self
        case .textFieldScreen:
            return TextFieldScreen.self
        case .waitToSeeScreen:
            return WaitToSeeScreen.self
        case .tableViewScreen:
            return TableViewScreen.self
        }
    }
}
