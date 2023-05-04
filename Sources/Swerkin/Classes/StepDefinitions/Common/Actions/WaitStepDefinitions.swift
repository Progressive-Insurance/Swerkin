/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Wait for trait defined by the given screen object displays otherwise fail step
    /// - Parameters:
    ///   - screen: PresentableScreen
    public func IWaitToSeeScreen(_ screen: PresentableScreen, file: StaticString = #file, line: UInt = #line) {
        self.performStep([screen.rawValue]) {
            self.viewTester.waitForAnimationsToFinish()
            if let screen = self.testCase.screenPresenter.screen(screen) {
                self.waitForElement(withIdentifier: screen.trait, file: file, line: line)
            } else {
                XCTFail("Screen: \(screen.rawValue) was not found")
            }
        }
    }

    /// Wait for element with given accessibility label to exist or until wait timeout is reached
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IWaitToSeeElement(withLabel label: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.waitForElement(withLabel: label, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility label prefix to exist or until wait timeout is reached
    /// - Parameters:
    ///   - withLabelPrefix: partial accessibility label
    public func IWaitToSeeElement(withLabelPrefix labelPrefix: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([labelPrefix]) {
            self.waitForElement(withLabelPrefix: labelPrefix, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility label suffix to exist or until wait timeout is reached
    /// - Parameters:
    ///   - withLabelSuffix: partial accessibility label
    public func IWaitToSeeElement(withLabelSuffix labelSuffix: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([labelSuffix]) {
            self.waitForElement(withLabelSuffix: labelSuffix, file: file, line: line)
        }
    }

    /// Wait for element with given partial accessibility label to exist or until wait timeout is reached
    /// - Parameters:
    ///   - withPartialLabel: partial accessibility label
    public func IWaitToSeeElement(withPartialLabel partialLabel: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([partialLabel]) {
            self.waitForElement(withPartialLabel: partialLabel, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility value to exist or until wait timeout is reached
    /// - Parameters:
    ///   - withValue: accessibility value
    public func IWaitToSeeElement(withValue value: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([value]) {
            self.waitForElement(withValue: value, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility identifier to exist or until wait timeout is reached
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IWaitToSeeElement(_ identifier: String,
                                  file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.waitForElement(withIdentifier: identifier, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility label to exist is tappable or until wait timeout is reached
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IWaitToSeeTappableElement(withLabel label: String,
                                          file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.waitUntilElementIsTappable(withLabel: label, file: file, line: line)
        }
    }

    /// Wait for element with given accessibility identifier is be tappable or until wait timeout is reached
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IWaitToSeeTappableElement(_ identifier: String,
                                          file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.waitUntilElementIsTappable(withIdentifier: identifier, file: file, line: line)
        }
    }

    /// Wait until element with given accessibility label no longer exists or until wait timeout is reached
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IWaitUntilIDoNotSeeElement(withLabel label: String,
                                           file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.waitUntilElementDoesNotExist(withLabel: label, file: file, line: line)
        }
    }

    /// Wait until element with given accessibility identifier no longer exists or until wait timeout is reached
    /// - Parameters:
    ///   - identifier: accessibility identifier
    public func IWaitUntilIDoNotSeeElement(_ identifier: String,
                                           file: StaticString = #file, line: UInt = #line) {
        self.performStep([identifier]) {
            self.waitUntilElementDoesNotExist(withIdentifier: identifier, file: file, line: line)
        }
    }

    /// Scroll until element with given accessibility label displays or end of screen is reached
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func IScrollDownUntilISeeElement(withLabel label: String,
                                            file: StaticString = #file, line: UInt = #line) {
        self.performStep([label]) {
            self.waitForElement(withLabel: label, file: file, line: line)
        }
    }

    /// Wait for given amount of seconds
    /// - Parameter seconds: Integer: Number of seconds to wait
    public func IWaitForSeconds(_ seconds: Int) {
        self.performStep(["\(seconds)"]) {
            self.test.viewTester().wait(forTimeInterval: TimeInterval(seconds))
        }
    }

    /// Wait until until top controller is an UIAlertController or until wait timeout is reached
    public func IWaitToSeeAlert(file: StaticString = #file, line: UInt = #line) {
        self.performStep {
            self.test.wait(for: {
                if var topController = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = topController.presentedViewController {
                        topController = presentedViewController
                    }

                    return topController is UIAlertController
                }

                return false
            }, errorMessage: "Did not find alert", file: file, line: line)
        }
    }
}
