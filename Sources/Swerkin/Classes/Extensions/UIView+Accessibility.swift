/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

public typealias AccessibilityPair = (label: String, identifier: String)

public extension UIView {

    func getAllAccessibilityLabels() -> [String] {
        var labels: [String] = []
        if let accessibilityLabel = self.accessibilityLabel, self.isHidden == false {
            // certain accessibility labels return AXAttributedString as the label,
            // this is a private Framework class that deals with accessibilityLabels
            // being treated as NSStrings, so they cast NSAttributedString to (id)
            // to force it to work. This is why we get AXAttributedString
            // unless we do the string by appending format
            labels.append("".appendingFormat("%@", accessibilityLabel))
        }

        self.subviews.forEach { subview in
            subview.getAllAccessibilityLabels().forEach({ labels.append($0) })
        }

        return labels
    }

    func getAllAccessibilityIdentifiers() -> [String] {
        var ids: [String] = []
        if let accessibilityIdentifier = self.accessibilityIdentifier, self.isHidden == false {
            ids.append(accessibilityIdentifier)
        }

        self.subviews.forEach { subview in
            subview.getAllAccessibilityIdentifiers().forEach({ ids.append($0) })
        }

        return ids
    }

    func getAllAccessibilityIdentifiers(withPrefix prefix: String) -> [String] {
        var ids: [String] = []
        if let accessibilityIdentifier = self.accessibilityIdentifier, self.isHidden == false && (self.accessibilityIdentifier?.hasPrefix(prefix) ?? false) {
            ids.append(accessibilityIdentifier)
        }

        self.subviews.forEach { subview in
            subview.getAllAccessibilityIdentifiers(withPrefix: prefix).forEach({ ids.append($0) })
        }

        return ids
    }

    func getAllAccessibilityIdentifiers(withSuffix suffix: String) -> [String] {
        var ids: [String] = []
        if let accessibilityIdentifier = self.accessibilityIdentifier, self.isHidden == false && (self.accessibilityIdentifier?.hasSuffix(suffix) ?? false) {
            ids.append(accessibilityIdentifier)
        }

        self.subviews.forEach { subview in
            subview.getAllAccessibilityIdentifiers(withSuffix: suffix).forEach({ ids.append($0) })
        }

        return ids
    }

    func getAllUIViews(withIdentifier identifier: String) -> [UIView] {
        var views: [UIView] = []

        if self.isHidden == false && self.accessibilityIdentifier == identifier {
            views.append(self)
        }

        self.subviews.forEach { subview in
            subview.getAllUIViews(withIdentifier: identifier).forEach({ views.append($0) })
        }

        return views
    }

    func getAllUIViewsWithIdentifierPrefix(_ prefix: String) -> [UIView] {
        var views: [UIView] = []

        if self.isHidden == false && (self.accessibilityIdentifier?.hasPrefix(prefix) ?? false) {
            views.append(self)
        }

        self.subviews.forEach { subview in
            subview.getAllUIViewsWithIdentifierPrefix(prefix).forEach({ views.append($0) })
        }

        return views
    }

    func getAllUIViewsWithIdentifierSuffix(_ suffix: String) -> [UIView] {
        var views: [UIView] = []

        if self.isHidden == false && (self.accessibilityIdentifier?.hasSuffix(suffix) ?? false) {
            views.append(self)
        }

        self.subviews.forEach { subview in
            subview.getAllUIViewsWithIdentifierSuffix(suffix).forEach({ views.append($0) })
        }

        return views
    }

    func getAllAccessibilityElements() -> [AccessibilityPair] {
        var elements: [AccessibilityPair] = []

        if let accessibilityIdentifier = self.accessibilityIdentifier,
           let accessibilityLabel = self.accessibilityLabel, self.isHidden == false {
            let label = "".appendingFormat("%@", accessibilityLabel)
            let element = AccessibilityPair(label: label, identifier: accessibilityIdentifier)
            elements.append(element)
        }

        self.subviews.forEach { subview in
            subview.getAllAccessibilityElements().forEach({ elements.append($0) })
        }

        return elements
    }
}
