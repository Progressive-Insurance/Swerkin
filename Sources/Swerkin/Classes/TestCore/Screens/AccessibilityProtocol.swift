/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

/// Protocol for `Accessible` objects
public protocol Accessible {
    associatedtype View: Accessibility
}

/// Protocol for `Accessibility` objects
public protocol Accessibility {
    var accessibilityIdentifier: String { get }
    var accessibilityLabel: String { get }
}
