/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class DropdownScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.textField.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "DropdownController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        var paths: [PathSegment] = []
        paths.append(PathSegment(
            start: ExamplePresentableScreen.buttonScreen,
            end: ExamplePresentableScreen.dropDownScreen,
            step: {
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.buttonScreen)
                self.test.And.IWaitToSeeTappableElement(ButtonScreen.View.enableButton.accessibilityIdentifier)
                self.test.And.ITouchButton(ButtonScreen.View.enableButton.accessibilityIdentifier)
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.dropDownScreen)
            },
            conditions: [PreconditionKey.loggedIn: true]
        ))
        
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case textField
        
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
                case .textField: return "textField"
                }
            }
        }
    }
}

