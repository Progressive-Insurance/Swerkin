/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

@testable
import Swerkin_Example

open class ExampleTestCase: BaseTestCase {

    open override func setUp() {
        super.setUp()

        self.screenPresenter.registerScreenProvider(ExampleScreenProvider(testCase: self), for: ExamplePresentableScreen.self)
    }

    open override func tearDown() {
        resetNavigation {
            self.navigateHome()
            self.waitForAnimationsToFinish()
        }

        super.tearDown()
    }

    open override class func setUp() {
        super.setUp()
    }

    open override class func tearDown() {
        super.tearDown()
    }

    private func resetNavigation(navigate: @escaping () -> Void) {
        if let alert = UIApplication.shared.topNavigationController()?.presentedViewController {
            alert.dismiss(animated: false) { navigate() }
        } else {
            navigate()
        }
    }
    
    private func navigateHome() {
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
