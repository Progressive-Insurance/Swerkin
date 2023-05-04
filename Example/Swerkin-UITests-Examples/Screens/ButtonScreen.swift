/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class ButtonScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.enableButton.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "ButtonViewController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        var paths: [PathSegment] = []
        paths.append(PathSegment(
            start: ExamplePresentableScreen.tappableScreen,
            end: ExamplePresentableScreen.buttonScreen,
            step: {
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.tappableScreen)
                self.test.And.IWaitToSeeTappableElement(TappableScreen.View.popUpButton.accessibilityIdentifier)
                self.test.And.ITouchButton(TappableScreen.View.popUpButton.accessibilityIdentifier)
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
            },
            conditions: [PreconditionKey.loggedIn: true]
        ))
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case enableButton
        case disableButton
        case highLightedButton

        var accessibilityLabel: String {
            get {
                switch self {
                default: return ""
                }
            }
        }

        var accessibilityIdentifier: String {
            get {
                switch self {
                case .enableButton: return "enableButton"
                case .disableButton: return "disableButton"
                case .highLightedButton: return "highLightedButton"
                }
            }
        }
    }
}
