/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

/// Protocol for `PresentableScreen` enum modules
public protocol PresentableScreen {
    var rawValue: String { get }
}

/// Protocol for `ScreenProvider` modules
public protocol ScreenProviderObject {
    /// (required) Returns the concrete instance of the `Screen` for presentation
    func screen(for: PresentableScreen) -> Screen?
    /// (optional) Returns a `Screen.Type?` that specifies the type of `Screen`
    func typeMarker(for: PresentableScreen) -> Screen.Type?
}

/// Screen provider for a given set of presentable screens
open class ScreenProvider<T>: ScreenProviderObject where T: PresentableScreen {
    public typealias CompareFunction = (Screen, AnyObject.Type) -> Bool

    public init() {}

    /// Provides screen object for a given presentable screen
    /// - Parameter for: Presentable Screen
    /// - Returns: Screen
    public func screen(for screen: PresentableScreen) -> Screen? {
        if let screen = screen as? T {
            return self.screen(for: screen)
        }
        return nil
    }

    /// Provides screen object type for a given presentable screen
    /// - Parameter for: Presentable Screen
    /// - Returns: Screens
    public func typeMarker(for screen: PresentableScreen) -> Screen.Type? {
        if let screen = screen as? T {
            return self.typeMarker(for: screen)
        }
        return nil
    }

    open func screen(for screen: T) -> Screen? {
        return nil
    }

    open func typeMarker(for screen: T) -> Screen.Type? {
        return nil
    }
}
