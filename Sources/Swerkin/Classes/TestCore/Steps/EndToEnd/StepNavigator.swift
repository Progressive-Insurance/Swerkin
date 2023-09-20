/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

/// PathSegement defines the execution path between two screens within the app under test
///
/// Multiple path segments will be used by end to end tests to define the complete execution path between the start of the app and the screen under test to make the tests easier to build, read, and understand.
///
/// - Variables
///   - start: Screen on which the execution path segment starts
///   - end: Screen on which the execution path segment ends
///   - step: One or more step definitions that when executed will drive the user from the start screen to end screen
///   - preconditions: List of preconditions that need to be satisified to use this path segment

import XCTest

public struct PathSegment {
    public var start: PresentableScreen
    public var end: PresentableScreen
    public var step: () -> Void
    public var preconditions: [PreconditionKey: Any] = [:]

    public init(start: PresentableScreen,
                end: PresentableScreen,
                step: @escaping () -> Void,
                conditions: [PreconditionKey: Any]) {
        self.start = start
        self.end = end
        self.step = step
        self.preconditions = conditions
    }

    public init(start: PresentableScreen,
                end: PresentableScreen,
                step: @escaping () -> Void) {
        self.init(start: start, end: end, step: step, conditions: [:])
    }
}

/// Finds and logs `best path` between two screens within the app under test
public class StepNavigator {

    /// FInds best path between two screens within the app under test
    /// - Parameters:
    ///   - startScreen: Screen on which the execution path starts
    ///   - endScreen: Screen on which the execution path ends
    ///   - conditions: Conditions to consider when located the best path
    ///   - presenter: Screen presenter used to return the screen object
    /// - Returns: List of Path Segments to execute
    func findPathToScreen(from startScreen: PresentableScreen,
                          to endScreen: PresentableScreen,
                          using conditions: [PreconditionKey: Any] = [:],
                          andPresenter presenter: ScreenPresenter) -> [PathSegment] {
        var path = [PathSegment]()
        var currentScreen = endScreen
        repeat {
            let nextPathSegment = findNextPathSegment(
                from: startScreen,
                to: currentScreen,
                using: conditions,
                andPresenter: presenter)
            guard let selectedSegment = nextPathSegment else {
                XCTContext.runActivity(named: "Could not find path to \(startScreen.rawValue)") { _ in
                    log(path.reversed())
                }
                return path.reversed()
            }
            path.append(selectedSegment)
            currentScreen = selectedSegment.start
        } while (currentScreen.rawValue != startScreen.rawValue)

        log(path.reversed())
        return path.reversed()
    }

    /// Finds the next path segment in the path based on best fit given the conditions
    /// - Parameters:
    ///   - startScreen: Screen on which the execution path starts
    ///   - endScreen: Screen on which the execution path ends
    ///   - conditions: Conditions to use to determine which path segment is the correct one to use
    ///   - presenter: Screen presenter used to return the screen object
    /// - Returns: PathSegment that given the conditions is the right one to use
    private func findNextPathSegment(from startScreen: PresentableScreen,
                                     to endScreen: PresentableScreen,
                                     using conditions: [PreconditionKey: Any] = [:],
                                     andPresenter presenter: ScreenPresenter) -> PathSegment? {
        print("StepNavigator: _______________________________________________")
        print("StepNavigator: Evaluating path segments for \(endScreen.rawValue)")

        guard let endScreen = presenter.screen(endScreen) else {
            return nil
        }

        var weight = -1
        let pathSegments = endScreen.entryPathSegments()
        var nextSegment: PathSegment?
        pathSegments.forEach { segment in
            let segmentWeight = evaluate(segment, conditions)
            log(segmentWeight, segment)
            if segmentWeight > weight {
                nextSegment = segment
                weight = segmentWeight
            }
        }
        return nextSegment
    }

    /// Evaluate the path based on the conditions provided and return a weight
    /// - Parameters:
    ///   - segment: PathSegment to evaluate
    ///   - conditions: conditions to use in the evaluation
    /// - Returns: Weight to compare against other path segments under consideration
    private func evaluate(_ segment: PathSegment, _ conditions: [PreconditionKey: Any]) -> Int {
        if segment.preconditions.isEmpty { return 1 }

        var matches = 0

        if segment.preconditions.count > conditions.count {
            return matches
        }

        conditions.keys.forEach { key in
            if let expectedValue = conditions[key], let actualValue = segment.preconditions[key] {
                if areEqual(expectedValue, actualValue) {
                    matches += 5
                }
            }
        }

        return matches
    }

    /// Log PathSegment and its weight
    /// - Parameters:
    ///   - segmentWeight: Weight of path segment
    ///   - segment: PathSegment
    private func log(_ segmentWeight: Int, _ segment: PathSegment) {
        var preconditions = "Preconditions:"
        if segment.preconditions.isEmpty { preconditions += "none" }
        segment.preconditions.forEach { (key, value) in
            preconditions += " \(key):\(value)"
        }
        print("StepNavigator: Segment Weight = \(segmentWeight) for Segment: \(segment.start.rawValue) -> \(segment.end.rawValue) with \(preconditions)")
    }

    /// Log entire list of path segments
    /// - Parameter path: List of path segments to be logged
    private func log(_ path: [PathSegment]) {
        if path.isEmpty {
            XCTFail("No path to follow")
            return
        }
        var pathStrArray: [String] = []
        path.forEach { segment in
            pathStrArray.append(segment.start.rawValue)
        }
        pathStrArray.append(path.last?.end.rawValue ?? "No Screen Name")

        let pathString = pathStrArray.joined(separator: "->")
        XCTContext.runActivity(named: "Path followed: \(pathString)") { _ in
            print("StepNavigator: Path followed \(pathString)")
        }
    }
}
