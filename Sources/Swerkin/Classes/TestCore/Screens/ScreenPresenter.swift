/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

/// Protocol for `ScreenPresenter` objects
///
/// Must include:
/// * registerScreenProvider: A way to register screen providers
/// * screenProvider: A way to return a specific screen provider given a certain type of presentable screen
/// * screen: A way to return a specific screen given a certain presentable screen
public protocol ScreenPresenter {
    func registerScreenProvider(_ provider: ScreenProviderObject,
                                for screenType: PresentableScreen.Type)
    func screenProvider(for screenType: PresentableScreen.Type) -> ScreenProviderObject
    func screen(_ screen: PresentableScreen) -> Screen?
}

/// Implementation for `Screen Presenter`
open class ScreenPresenterImpl: ScreenPresenter {
    private var screenProviders: [String: ScreenProviderObject]

    public init() {
        self.screenProviders = [String: ScreenProviderObject]()
    }

    /// Register screen provider used by the screen presenter
    /// - Parameters:
    ///   - provider: Screen provider to register
    ///   - for: Type of presentable screen which is being registered
    open func registerScreenProvider(_ provider: ScreenProviderObject,
                                     for screenType: PresentableScreen.Type) {
        let registeredName = String(describing: screenType)
        self.screenProviders[registeredName] = provider
    }

    /// Screen Provider based on given presentable screen type
    /// - Parameter for: Type of presentable screen
    /// - Returns: Screen Provider associated with that type of presentable screen
    open func screenProvider(for screenType: PresentableScreen.Type) -> ScreenProviderObject {
        let registeredName = String(describing: screenType)
        if let provider = self.screenProviders[registeredName] {
            return provider
        }

        fatalError("No registered screenProvider for type \(screenType)")
    }

    /// Screen object based on given presentable screen
    /// - Parameter screen: Presentable screen associated with screen object
    /// - Returns: Screen object
    open func screen(_ screen: PresentableScreen) -> Screen? {
        let provider = self.screenProvider(for: type(of: screen))
        return provider.screen(for: screen)
    }
}
