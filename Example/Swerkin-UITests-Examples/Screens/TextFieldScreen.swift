/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TextFieldScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.firstNameTextField.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "TextFieldViewController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        let paths: [PathSegment] = []
        
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case firstNameTextField
        case firstNameLabel
        case firstNameError
        case lastNameTextField
        case lastNameLabel
        case lastNameError
        case infoTextView

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
                case .firstNameTextField: return "firstname_textField"
                case .firstNameLabel: return "firstname_label"
                case .firstNameError: return "firstname_error"
                case .infoTextView: return "info_textView"
                case .lastNameTextField: return "lastname_TextField"
                case .lastNameLabel: return "lastname_label"
                case .lastNameError: return "lastname_error"
                }
            }
        }
    }
}
