/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class ExampleScreenRenderer: ScreenRenderer {
    func screen(_ screenObject: Screen, didRenderWithAuth isAuth: Bool) {
       guard let screenObject = screenObject as? ExampleBaseScreen else { return }
        
        if isAuth {
            //Add code that is special to your app when the user is authenticated
        }
        
        //Navigation code to render the ViewController and add it to the stack to navigate directly to it
        if let navigationController = UIApplication.shared.topNavigationController() {
            navigationController.pushViewController(screenObject.create(), animated: false)
        }
        screenObject.viewTester.waitForAnimationsToFinish()
        screenObject.waitForElement(withIdentifier: screenObject.trait)
    }
}
