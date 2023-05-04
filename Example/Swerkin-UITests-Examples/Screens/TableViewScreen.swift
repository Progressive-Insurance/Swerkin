/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TableViewScreen: ExampleBaseScreen, Accessible {

    override var trait: String {
        get {
            return View.headerLabel.accessibilityIdentifier
        }
    }
    
    override var name: String { get { return "One More Step" }}

    override func create() -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "TableViewController")
    }
    
    override func entryPathSegments() -> [PathSegment] {
        let paths: [PathSegment] = []
        
        return paths
    }

    override func renderScreen() {
        renderer.screen(self, didRenderWithAuth: false)
    }

    enum View: Accessibility {
        case headerLabel
        case firstCell
        case secondCell
        case thirdCell
        

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
                case .headerLabel: return "headerLabel"
                case .firstCell: return "firstCell"
                case .secondCell: return "secondCell"
                case .thirdCell: return "thirdCell"
                }
            }
        }
    }
}

