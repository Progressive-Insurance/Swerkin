/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Swipe in the given direction
    /// - Parameters:
    ///   - direction: KIFSwipeDirection
    public func ISwipe(_ direction: KIFSwipeDirection, file: StaticString = #file, line: UInt = #line) {
        self.performStep(["\(direction)"]) {
            self.swipe(direction: direction, file: file, line: line)
            self.test.viewTester().waitForAnimationsToFinish()
        }
    }

    /// Swipe on an element in the given direction
    /// - Parameters:
    ///   - direction: KIFSwipeDirection
    ///   - onElement: accessibility identifier
    public func ISwipe(_ direction: KIFSwipeDirection, onElement identifier: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep(["\(direction)"]) {
            self.swipeOn(identifier: identifier, direction: direction, file: file, line: line)
        }
    }

    /// Swipe to the left on a scrollable element
    public func ISwipeToTheLeft(file: StaticString = #file, line: UInt = #line) {
        self.performStep {
            let predicate = NSPredicate(format: "SELF isKindOfClass:%@", argumentArray: [UIScrollView.self])
            self.testCase.waiting(for: self.test.viewTester().view(withPredicate: predicate) != nil, errorMessage: "Did not find scrollable", file: file, line: line)
            let frame = self.test.viewTester().usingPredicate(predicate).view.bounds
            let xPoint = frame.midX + (frame.maxX - frame.midX)/2
            self.test.viewTester().usingPredicate(predicate).view.drag(from: CGPoint(x: xPoint, y: 1), to: CGPoint(x: 1, y: 1))
            self.test.viewTester().waitForAnimationsToFinish()
        }
    }

    /// Swipe to the right on a scrollable element
    public func ISwipeToTheRight(file: StaticString = #file, line: UInt = #line) {
        self.performStep {
            let predicate = NSPredicate(format: "SELF isKindOfClass:%@", argumentArray: [UIScrollView.self])
            self.testCase.waiting(for: self.test.viewTester().view(withPredicate: predicate) != nil, errorMessage: "Did not find scrollable", file: file, line: line)
            let frame = self.test.viewTester().usingPredicate(predicate).view.bounds
            let xPoint = frame.midX + (frame.maxX - frame.midX)/2
            self.test.viewTester().usingPredicate(predicate).view.drag(from: CGPoint(x: 1, y: 1), to: CGPoint(x: xPoint, y: 1))
            self.test.viewTester().waitForAnimationsToFinish()
        }
    }
}
