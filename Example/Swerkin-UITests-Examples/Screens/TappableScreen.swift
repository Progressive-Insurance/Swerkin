/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TappableScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.checkBox.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "TappableViewController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        var paths: [PathSegment] = []
        paths.append(PathSegment(
            start: ExamplePresentableScreen.waitToSeeScreen,
            end: ExamplePresentableScreen.tappableScreen,
            step: {
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.waitToSeeScreen)
                self.test.And.IWaitToSeeTappableElement(WaitToSeeScreen.View.loader.accessibilityIdentifier)
                self.test.And.ITouchButton(WaitToSeeScreen.View.loader.accessibilityIdentifier)
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.tappableScreen)
            },
            conditions: [PreconditionKey.loggedIn: true]
        ))
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case checkBox
        case toggleSwitch
        case toggleSwitch2
        case link
        case infoButton
        case doneButton
        case popUpButton
        case helloLabel
        
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
                case .checkBox: return "checkBox"
                case .toggleSwitch: return "toggleSwitch"
                case .toggleSwitch2: return "toggleSwitch2"
                case .link: return "link"
                case .infoButton: return "infoButtonItemID"
                case .doneButton: return "doneButtonItemID"
                case .popUpButton: return "popUpButton"
                case .helloLabel: return "hello"
                }
            }
        }
    }
}
