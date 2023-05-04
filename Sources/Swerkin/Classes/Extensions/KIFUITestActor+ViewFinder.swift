/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import KIF
import UIKit

public extension UIWindow {

    func showingViewController() -> UIViewController? {
        return UIApplication.shared.keyWindow?.topMostController()
    }
}

// Used for casting a result to specific class type

public extension KIFUIViewTestActor {
    
    func viewWithAccessibilityElement(element: UIAccessibilityElement) -> UIView {
        return UIAccessibilityElement.viewContaining(element)
    }
    
    func findAccessibilityElement(withIdentifier identifier: String) -> UIAccessibilityElement? {
        let predicate = NSPredicate(format: "accessibilityIdentifier == %@", argumentArray: [identifier])
        var element: UIAccessibilityElement?
        do {
            try UIAccessibilityElement.accessibilityElement(&element, view: nil, withElementMatching: predicate, tappable: false)
            return element
        } catch {
            XCTFail("Exception while querying \(identifier) identifier")
        }
        XCTFail("\(identifier) identifier not found!")
        return nil
    }
    
    func findAccessibilityElement(withLabel label: String) -> UIAccessibilityElement? {
        let predicate = NSPredicate(format: "accessibilityLabel == %@", argumentArray: [label])
        var element: UIAccessibilityElement?
        do {
            try UIAccessibilityElement.accessibilityElement(&element, view: nil, withElementMatching: predicate, tappable: false)
            return element
        } catch {
            XCTFail("Exception while querying \(label) label")
        }
        XCTFail("\(label) identifier not found!")
        return nil
    }
    
    func tryFindingTappableView(withAccessibilityIdentifier identifier: String) throws {
        let predicate = NSPredicate(format: "accessibilityIdentifier == %@", argumentArray: [identifier])
        try UIAccessibilityElement.accessibilityElement(nil, view: nil, withElementMatching: predicate, tappable: true)
    }
    
    func tryFindingTappableView(withAccessibilityValue value: String) throws {
        let predicate = NSPredicate(format: "accessibilityValue == %@", argumentArray: [value])
        try UIAccessibilityElement.accessibilityElement(nil, view: nil, withElementMatching: predicate, tappable: true)
    }
    
    func view(withPredicate predicate: NSPredicate) -> UIView? {
        var view: UIView?
        do {
            try UIAccessibilityElement.accessibilityElement(nil, view: &view, withElementMatching: predicate, tappable: false)
            return view
        } catch {
            return view
        }
    }
    
    func view(withIdentifier identifier: String? = nil, withLabel label: String? = nil) -> UIView? {
        let element = accessibilityElement(with: identifier, withLabel: label)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func button(withIdentifier identifier: String? = nil, withLabel label: String? = nil) -> UIButton? {
        let element = accessibilityElement(with: identifier, withLabel: label)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UIButton
    }
    
    func label(withIdentifier identifier: String) -> UILabel? {
        let element = accessibilityElement(with: identifier)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UILabel
    }
    
    func image(withIdentifier identifier: String? = nil, withLabel label: String? = nil) -> UIImageView? {
        let element = accessibilityElement(with: identifier, withLabel: label)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UIImageView
    }
    
    func image(withLabel label: String) -> UIImageView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel == label
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UIImageView
    }
    
    func textField(withFieldLabel label: String) -> UITextField? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel == label
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele).superview as? UITextField
    }
    
    func textField(withIdentifier id: String? = nil, withLabel label: String? = nil) -> UITextField? {
        let element = accessibilityElement(with: id, withLabel: label)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UITextField
    }
    
    func textField(withId id: String? = nil, withValue val: String? = nil) -> UITextField? {
        let element = accessibilityElement(with: id, withValue: val)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UITextField
    }
    
    func multiLineTextField(withIdentifier id: String? = nil, withValue val: String? = nil) -> UITextView? {
        let element = accessibilityElement(with: id, withValue: val)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UITextView
    }
    
    func tableCell(withIdentifier id: String? = nil, withLabel label: String? = nil) -> UITableViewCell? {
        let element = accessibilityElement(with: id, withLabel: label)
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? UITableViewCell
    }
    
    func viewWithLabel(label: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel?.contains(label) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withLabelPrefix prefix: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel?.hasPrefix(prefix) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withLabelSuffix suffix: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel?.hasSuffix(suffix) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(andLabelContains expectedValue: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel?.contains(expectedValue) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withIdentifier identifier: String) -> UIView? {
        if let element = self.accessibilityElement(with: identifier) {
            return viewWithAccessibilityElement(element: element)
        }
        return nil
    }
    
    func view(withIdentifierPrefix prefix: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityIdentifier?.hasPrefix(prefix) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withIdentifierSuffix suffix: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityLabel?.hasSuffix(suffix) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withValue value: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityValue?.contains(value) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view(withIdentifier identifier: String, withValue value: String) -> UIView? {
        if let element = self.accessibilityElement(with: identifier, withValue: value) {
            return viewWithAccessibilityElement(element: element)
        }
        return nil
    }
    
    func viewWith(trait: UIAccessibilityTraits, andLabel label: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return (element?.accessibilityTraits.contains(trait) ?? false) && (element?.accessibilityLabel == label)
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func viewWith(trait: UIAccessibilityTraits, andIdentifier id: String) -> UIView? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return (element?.accessibilityTraits.contains(trait) ?? false) && (element?.accessibilityIdentifier == id)
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele)
    }
    
    func view<T: UIView>(withIdentifier identifier: String, asType viewType: T) -> T? {
        let element = UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement?) in
            return element?.accessibilityIdentifier?.contains(identifier) ?? false
        })
        guard let ele = element else { return nil }
        return viewWithAccessibilityElement(element: ele) as? T
    }
    
    func accessibilityElement(with identifier: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityIdentifier == identifier
        })
    }
    
    func accessibilityElement(withLabel label: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityLabel == label
        })
    }
    
    func accessibilityElement(withPartialLabel partialLabel: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityLabel?.contains(partialLabel) ?? false
        })
    }
    
    func accessibilityElement(withValue value: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityValue == value
        })
    }
    
    func accessibilityElement(with id: String?, withValue val: String?) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            if let id = id, let val = val {
                return (element?.accessibilityIdentifier == id) && (element?.accessibilityValue == val)
            }
            if let id = id {
                return element?.accessibilityIdentifier == id
            }
            if let val = val {
                return element?.accessibilityValue == val
            }
            return false
        })
    }
    
    func accessibilityElement(with identifier: String?, withLabel label: String?) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            if let id = identifier, let label = label {
                let actualLabel = label.replacingOccurrences(of: "\n", with: " ")
                return (element?.accessibilityIdentifier == id) && (element?.accessibilityLabel?.replacingOccurrences(of: "\n", with: " ") == actualLabel)

            }
            if let id = identifier {
                return element?.accessibilityIdentifier == id
            }
            if let label = label {
                let actualLabel = label.replacingOccurrences(of: "\n", with: " ")
                return element?.accessibilityLabel?.replacingOccurrences(of: "\n", with: " ") == actualLabel

            }
            return false
        })
    }
    
    func accessibilityElement(withPrefix prefix: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityLabel?.hasPrefix(prefix) ?? false
        })
    }
    
    func accessibilityElement(withSuffix suffix: String) -> UIAccessibilityElement? {
        return UIApplication.shared.accessibilityElement(matching: { (element: UIAccessibilityElement!) in
            return element?.accessibilityLabel?.hasSuffix(suffix) ?? false
        })
    }
}
