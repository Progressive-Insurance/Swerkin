/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import XCTest

/// Swerkin step types of Given, When, Then, And
///
/// Use these step types to qualify the steps within the test case for a Gherkin-like experience
public enum StepType {
    case Given, When, Then, And
}

/// Swerkin Step class to allow for a Gherkin-like experience
///
/// Includes:
/// * Current step type
/// * An instance of the current test case
/// * Test observer to watch for step success or failure
/// * Screenshot attachment when step fails
public class Steps: NSObject, XCTestObservation {

    static var attached: Bool = false
    public private(set) var stepType: StepType
    public private(set) var test: XCTestCase

    public required init(stepType: StepType, test: XCTestCase) {
        self.stepType = stepType
        self.test = test
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }

    public func testCaseWillStart(_ testCase: XCTestCase) {
        self.test = testCase
        Steps.attached = false
    }

    public func testCase(_ testCase: XCTestCase, didRecord issue: XCTIssue) {
        if #available(iOS 9.0, OSX 10.11, *), !Steps.attached {
            test.attachScreenshot(test.name)
            Steps.attached = true
        }
    }

    deinit {
        XCTestObservationCenter.shared.removeTestObserver(self)
    }

    /// Call this method inside the step definition to allow for better logging in the test report
    /// - Parameters:
    ///   - values: Array of descriptions of paramters being passed to the step
    ///   - name: Name of the step defaulted to name of step description
    ///   - f: Step definition
    public func performStep(_ values: [String] = [],
                            _ name: String = #function,
                            f: () -> Void) {
        let value = values.joined(separator: ", ")
        let stepName = "\(stepType) \(name): \(value)"
        XCTContext.runActivity(named: stepName) { (_) in
            f()
        }
    }

    /// This method is used by the StepNavigator to execute steps defined by path from one screen to another
    /// - Parameters:
    ///   - fromScreen: Screen on which the execution path starts
    ///   - toScreen: Screen on which the excution the path ends
    public func executeSteps(from fromScreen: PresentableScreen, to toScreen: PresentableScreen) {
        let path = StepNavigator().findPathToScreen(
            from: fromScreen,
            to: toScreen,
            using: self.testCase.preconditions,
            andPresenter: self.testCase.screenPresenter)

        for segment in path {
            segment.step()
        }
    }
}

private var automaticScreenshotsQuality: XCTAttachment.ImageQuality = .medium
private var automaticScreenshotsLifetime: XCTAttachment.Lifetime = .deleteOnSuccess

/// Extension of XCTestCase to capture screenshot and attach it to the test
extension XCTestCase {

    public static func setScreenshotsBehaviour(quality: XCTAttachment.ImageQuality = .medium,
                                               lifetime: XCTAttachment.Lifetime = .deleteOnSuccess) {
        automaticScreenshotsQuality = quality
        automaticScreenshotsLifetime = lifetime
    }

    /// Attach screen shot only if there is a host app running
    /// - Parameter name: Name of the attachment
    func attachScreenshot(_ name: String? = nil) {
        // if tests have no host app there is no point in making screenshots
        guard Bundle.main.bundlePath.hasSuffix(".app") else { return }

        let screenshot = snapshotScreen()

        let attachment = XCTAttachment(image: screenshot!, quality: automaticScreenshotsQuality)
        attachment.lifetime = automaticScreenshotsLifetime
        if let screenshotName = name {
            attachment.name = screenshotName
        }
        add(attachment)
    }

    func snapshotScreen() -> UIImage? {
        let view = UIScreen.main.snapshotView(afterScreenUpdates: true)
        view.layoutIfNeeded()

        let bounds = view.bounds
        assert(bounds.width != 0, "Zero width for view \(view)")
        assert(bounds.height != 0, "Zero height for view \(view)")

        let graphicsImageRenderer = UIGraphicsImageRenderer(size: bounds.size)
        return graphicsImageRenderer.image(actions: { _ in
            view.drawHierarchy(in: bounds, afterScreenUpdates: true)
        })
    }

}
