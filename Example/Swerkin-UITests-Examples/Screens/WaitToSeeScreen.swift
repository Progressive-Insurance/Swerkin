/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class WaitToSeeScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.firstLabel.accessibilityIdentifier
        }
    }

    override var name: String { get { return "This label is the only item in the stackview initially" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "WaitToSeeViewController")
    }

    override func entryPathSegments() -> [PathSegment] {
        var paths: [PathSegment] = []
        paths.append(PathSegment(
            start: ExamplePresentableScreen.endToEndScreen,
            end: ExamplePresentableScreen.waitToSeeScreen,
            step: {
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.endToEndScreen)
                self.test.And.IWaitToSeeTappableElement(EndToEndScreen.View.startTestButton.accessibilityIdentifier)
                self.test.And.ITouchButton(EndToEndScreen.View.startTestButton.accessibilityIdentifier)
                self.test.And.IWaitToSeeScreen(ExamplePresentableScreen.waitToSeeScreen)
            },
            conditions: [PreconditionKey.loggedIn: true]
        ))
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case alert
        case alertButton
        case fifthLabel
        case firstImage
        case firstLabel
        case fourthLabel
        case loader
        case scrollLoader
        case secondImage
        case secondLabel
        case sixthLabel
        case switchItem
        case thirdLabel

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
                case .alert: return "wait_to_see_alert"
                case .alertButton: return "wait_to_see_alert_button"
                case .fifthLabel: return "wait_to_see_fifth_label"
                case .firstImage: return "wait_to_see_first_image"
                case .firstLabel: return "wait_to_see_first_label"
                case .fourthLabel: return "wait_to_see_fourth_label"
                case .loader: return "wait_to_see_loader"
                case .scrollLoader: return "wait_to_see_scroll_loader"
                case .secondImage: return "wait_to_see_second_image"
                case .secondLabel: return "wait_to_see_second_label"
                case .sixthLabel: return "wait_to_see_sixth_label"
                case .switchItem: return "wait_to_see_switch"
                case .thirdLabel: return "wait_to_see_third_label"
                }
            }
        }
    }
}
