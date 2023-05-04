/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class HomeScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.buttonComponent.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "ViewController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        let paths: [PathSegment] = []
        
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case buttonComponent
        
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
                case .buttonComponent: return "buttonComponent"
                }
            }
        }
    }
}
