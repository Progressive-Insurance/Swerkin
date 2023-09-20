/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

public extension Viewable where Self: Screen {
    func element(withIdentifier identifier: String) -> UIView? {
        return self.viewTester.view(withIdentifier: identifier)
    }

    func element(withLabel label: String) -> UIView? {
        return self.viewTester.view(withLabel: label)
    }

    func allElements(withIdentifier identifier: String) -> [UIView] {
        let elements: [UIView] = (UIApplication.shared.keyWindow?.currentViewController()?.view.getAllUIViews(withIdentifier: identifier))!
        return elements.reversed()
    }

    func allElements(withIdentifierPrefix prefix: String) -> [UIView] {
        let elements: [UIView] = (UIApplication.shared.keyWindow?.currentViewController()?.view.getAllUIViewsWithIdentifierPrefix(prefix))!
        return elements.reversed()
    }

    func allLabels(for element: UIView) -> [String] {
        var allLabels = [String]()
        if let parentLabel = element.accessibilityLabel {
            allLabels.append(parentLabel)
        }

        let nestedLabels = allNestedSubviews(element).compactMap { (subview) -> String? in
            return subview.accessibilityLabel
        }

        allLabels.append(contentsOf: nestedLabels)

        return allLabels
    }

    func allValues(for element: UIView) -> [String] {
        var allValues = [String]()
        if let parentValue = element.accessibilityValue {
            allValues.append(parentValue)
        }

        let nestedValues = allNestedSubviews(element).compactMap { (subview) -> String? in
            return subview.accessibilityValue
        }

        allValues.append(contentsOf: nestedValues)

        return allValues
    }

    func allNestedSubviews(_ parent: UIView) -> [UIView] {
        var allSubviews = [UIView]()
        allSubviews.append(contentsOf: parent.subviews)
        parent.subviews.forEach { (child) in
            allSubviews.append(contentsOf: allNestedSubviews(child))
        }
        return allSubviews
    }
}
