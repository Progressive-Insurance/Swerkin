/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import CoreFoundation
import CoreGraphics
import XCTest

extension Steps {

    /// Touch element with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func ITouchElement(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.touchView(withLabel: label, file: file, line: line)
            self.viewTester.waitForAnimationsToFinish()
        }
    }

    /// Touch element with given accessibility identifier
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func ITouchElement(_ identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.touchView(withIdentifier: identifier, file: file, line: line)
            self.viewTester.waitForAnimationsToFinish()
        }
    }

    /// Long press element with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func ILongPressElement(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.longPressView(withLabel: label, file: file, line: line)
            self.viewTester.waitForAnimationsToFinish()
        }
    }

    /// Long press element with given accessibility identifier
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func ILongPressElement(_ identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.longPressView(withIdentifier: identifier, file: file, line: line)
            self.viewTester.waitForAnimationsToFinish()
        }
    }

    /// Touch element with accessibility label `Back`
    public func IGoBack(file: StaticString = #file, line: UInt = #line) {
        self.performStep {
            self.touchView(withLabel: "Back", file: file, line: line)
            self.viewTester.waitForAnimationsToFinish()
        }
    }

    /// Acknowledge System Alert
    /// Note: only works for simulators with iOS version 13.5 or lower
    public func ITouchAllowSystemAlert() {
        self.performStep {
            #if TARGET_IPHONE_SIMULATOR
            self.viewTester.acknowledgeSystemAlert()
            #endif
        }
    }

    /// Dismiss any modal / popover on the screen
    public func IDismissModal() {
        self.performStep {
            self.viewTester.dismissPopover()
        }
    }

    /// Tap checkbox with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    public func ITapCheckbox(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            self.touchView(withIdentifier: id, file: file, line: line)
        }
    }

    /// Toggle switch with given accessibility identifier
    /// - Parameters:
    ///   - id: accessibility identifier
    ///   - switchIsOn: Bool:  that determines if the switch is on or off
    public func IToggleSwitch( _ id: String, to switchIsOn: Bool, file: StaticString = #file, line: UInt = #line) {

        self.performStep([id, switchIsOn.description]) {
            self.setSwitch(withIdentifier: id, to: switchIsOn)
        }
    }

    /// Touch button bar button with given accessibility label
    /// - Parameter label: accessibility label
    public func ITouchButtonBarButton(withLabel label: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.test.viewTester().usingLabel(label)?.usingTraits(.button).tap()
        }
    }

    /// Dismiss popover by touching outside the popover zone on the screen
    public func IDismissPopoverElement(file: StaticString = #file, line: UInt = #line) {
        self.performStep {
            self.viewTester.waitForAnimationsToFinish()
            self.viewTester.dismissPopover()
            self.viewTester.tapScreen(at: CGPoint(x: 10, y: 50))
        }
    }

    /// Touch middle of element with a given accessibility identifier
    ///
    /// Only use this step when the other steps do not work because this step is very fragile and might cause flakiness
    /// - Parameters:
    ///   - id: accessibility identifier
    public func ITouchMiddleOf(_ id: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([id]) {
            if let view = self.viewTester.usingIdentifier(id)?.view,
               let screenSpace = view.window?.screen.fixedCoordinateSpace {
                let point = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
                let screenPoint = view.convert(point, to: screenSpace)
                self.viewTester.tapScreen(at: screenPoint)
            } else {
                XCTFail("Cannot find element with id \(id)")
            }
        }
    }
}
