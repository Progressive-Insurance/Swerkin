/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class EndToEndScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.startTestButton.accessibilityIdentifier
        }
    }

    override var name: String { get { return "Start End To End Test" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "EndToEndViewController")
    }

    override func entryPathSegments() -> [PathSegment] {
        let paths: [PathSegment] = []

        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case startTestButton

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
                case .startTestButton: return "endtoend_start_button"
                }
            }
        }
    }
}
