/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit

extension Steps {
    /// Print all accessibility labels of the top most view controller
    public func IPrintAllLabels() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let labels = UIWindow().topMostController()?.view.getAllAccessibilityLabels()
            print("========================")
            print(labels as Any)
            print("========================")
        }
    }

    /// Print all accessibility identifiers of the top most view controller
    public func IPrintAllIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let ids = UIWindow().topMostController()?.view.getAllAccessibilityIdentifiers()
            print("========================")
            print(ids as Any)
            print("========================")
        }
    }

    /// Print all accessibility labels and identifiers of the top most view controller
    public func IPrintAllLabelsAndIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let allElements = UIWindow().topMostController()?.view.getAllAccessibilityElements()
            print("========================")
            print(allElements as Any)
            print("========================")
        }
    }
}

// MARK: SwiftUI + Swift 6 concurrency support for accessibility traversal

@MainActor
public extension Steps {
    /// Prints all accessibility labels reachable from the top-most view controller
    func IPrintAllSwiftUILabels() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let labels = self.topController()?.view.collectSwiftUIAccessibilityLabels() ?? []
            print("========================")
            print(labels)
            print("========================")
        }
    }

    /// Prints all accessibility identifiers reachable from the top-most view controller
    func IPrintAllSwiftUIIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let ids = self.topController()?.view.collectSwiftUIAccessibilityIdentifiers() ?? []
            print("========================")
            print(ids)
            print("========================")
        }
    }

    /// Prints all accessibility (label, identifier) pairs reachable from the top-most view controller
    func IPrintAllSwiftUILabelsAndIdentifiers() {
        self.performStep {
            self.viewTester.wait(forTimeInterval: 2)
            let pairs = self.topController()?.view.collectSwiftUIAccessibilityElements() ?? []
            print("========================")
            print(pairs)
            print("========================")
        }
    }
}

// MARK: - SwiftUI-aware accessibility traversal

@MainActor
private extension UIView {
    func collectSwiftUIAccessibilityLabels() -> [String] {
        var labels: [String] = []
        SwiftUIAccessibilityWalker.walk(self) { node in
            guard let label = node.accessibilityLabel, !label.isEmpty else { return }
            labels.append("".appendingFormat("%@", label))
        }
        return labels
    }

    func collectSwiftUIAccessibilityIdentifiers() -> [String] {
        var ids: [String] = []
        SwiftUIAccessibilityWalker.walk(self) { node in
            guard let id = node.accessibilityIdentifier, !id.isEmpty else { return }
            ids.append(id)
        }
        return ids
    }

    func collectSwiftUIAccessibilityElements() -> [AccessibilityPair] {
        var pairs: [AccessibilityPair] = []
        SwiftUIAccessibilityWalker.walk(self) { node in
            guard let id = node.accessibilityIdentifier, !id.isEmpty,
                  let label = node.accessibilityLabel, !label.isEmpty else { return }
            pairs.append(AccessibilityPair(label: "".appendingFormat("%@", label),
                                           identifier: id))
        }
        return pairs
    }
}

/// A single node in the accessibility traversal - either a real `UIView` or a
/// `UIAccessibilityElement` produced by SwiftUI.
@MainActor
private struct AccessibilityNode {
    let accessibilityLabel: String?
    let accessibilityIdentifier: String?

    init(view: UIView) {
        self.accessibilityLabel = view.accessibilityLabel
        self.accessibilityIdentifier = view.accessibilityIdentifier
    }

    init(element: NSObject) {
        self.accessibilityLabel = element.value(forKey: "accessibilityLabel") as? String
        self.accessibilityIdentifier = (element as? UIAccessibilityIdentification)?.accessibilityIdentifier
            ?? element.value(forKey: "accessibilityIdentifier") as? String
    }
}

private enum SwiftUIAccessibilityWalker {
    /// Depth-first traversal that visits every visible `UIView` in the
    /// hierarchy plus every entry in each view's `accessibilityElements`
    /// array (the mechanism SwiftUI uses to publish its a11y tree).
    @MainActor
    static func walk(_ root: UIView, visit: (AccessibilityNode) -> Void) {
        guard !root.isHidden else { return }

        visit(AccessibilityNode(view: root))

        if let elements = root.accessibilityElements as? [NSObject] {
            for element in elements {
                visitElement(element, visit: visit)
            }
        }

        for subview in root.subviews {
            walk(subview, visit: visit)
        }
    }

    @MainActor
    private static func visitElement(_ element: NSObject,
                                     visit: (AccessibilityNode) -> Void) {
        if let view = element as? UIView {
            walk(view, visit: visit)
            return
        }

        visit(AccessibilityNode(element: element))

        // Some SwiftUI a11y elements are themselves containers.
        if let nested = element.value(forKey: "accessibilityElements") as? [NSObject] {
            for child in nested {
                visitElement(child, visit: visit)
            }
        }
    }
}
