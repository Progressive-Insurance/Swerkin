/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

public enum ExamplePresentableScreen: String, PresentableScreen {
    case buttonScreen
    case dropDownScreen
    case endToEndScreen
    case homeScreen
    case swipeScreen
    case tappableScreen
    case textFieldScreen
    case waitToSeeScreen
    case tableViewScreen
    
    public var rawValue: String {
        get {
            return String(describing: self).capitalized
        }
    }
}
