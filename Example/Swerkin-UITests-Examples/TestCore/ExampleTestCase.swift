/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

@testable
import Swerkin_Example

@MainActor
open class ExampleTestCase: BaseTestCase, @unchecked Sendable {

    open override func setUp() {
        super.setUp()
        MainActor.assumeIsolated {
            self.screenPresenter.registerScreenProvider(ExampleScreenProvider(testCase: self), for: ExamplePresentableScreen.self)
        }
        
        
        addTeardownBlock { @MainActor [weak self]  in
            guard let self else { return }
            self.cleanupNavigation()
        }
    }
    
    @MainActor
    private func cleanupNavigation() {
        resetNavigation {
            self.navigateHome()
            self.waitForAnimationsToFinish()
        }
    }

    open override class func setUp() {
        super.setUp()
    }

    open override class func tearDown() {
        super.tearDown()
    }

    @MainActor
    private func resetNavigation(navigate: @escaping @MainActor () -> Void) {
        if let alert = UIApplication.shared.topNavigationController()?.presentedViewController {
            alert.dismiss(animated: false) { navigate() }
        } else {
            navigate()
        }
    }
    
    @MainActor private func navigateHome() {
        guard let rootNavController = UIApplication.shared.rootNavigationController()  else {
            fatalError("Failed to get rootViewController")
        }

        //Look for alerts or modals on top of the root nav...
        if(rootNavController.topViewController != rootNavController.visibleViewController) {
            //Dismiss alert or modal so that it isn't orphaned on top of the fresh nav stack...
            rootNavController.visibleViewController?.dismiss(animated: false, completion: {
                //Pop to root...
            rootNavController.setViewControllers([ViewController()], animated: false)
            })
        } else { //Pop to root...
            rootNavController.setViewControllers([ViewController()], animated: false)
        }
    }
}
