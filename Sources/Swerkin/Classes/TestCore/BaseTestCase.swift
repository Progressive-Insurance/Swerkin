/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import UIKit
import KIF
import XCTest

/**
 BaseTestCase subclasses @c KIFTestCase to add setup and teardown steps that can be used to execute UI test steps.

 Included are the following features:
 *  Test tagging - ability to tag certain test classes and test functions in order to buid dynamic test suites
 *  Test info - dictionary to store specific data needed for the test
 *  Preconditions - dictionary to hold setup data to determine what direction the flow and/or end-to-end test should take
 *  Screen presenter - dictionary of screen providers to return specific presentable screens when needed by the test
 *  Timeouts - all can be overriden
 * default timeout for entire test before failing
 * default timeout for waiting
 * default timeout before failing validations
 */
open class BaseTestCase: KIFTestCase {

    open class var tags: [TestTag] { return [.all] }

    open var testInfo: [String: Any] = [:]
    open var currentScreen: PresentableScreen?
    open var preconditions: [PreconditionKey: Any] = [:]
    public let screenPresenter: ScreenPresenter = ScreenPresenterImpl()

    open var testTimeout: Int { get { return 60 }}
    open var waitingTimeout: TimeInterval { get { return 2.0 }}
    open class var validationTimeout: TimeInterval { get { return 2.0 }}

    private static let includeTags: [TestTag] = ProcessInfo.processInfo.getListOfTags(from: "TEST_TAGS")
    private static let excludeTags: [TestTag] = ProcessInfo.processInfo.getListOfTags(from: "EXCLUDE_TAGS")

    /// Method runs before every test
    override open func setUp() {
        super.setUp()
    }

    /// Method runs before every test and is used to skip tests unless they have been tagged with a tag in the include list and not tagged with a tag in the exclude list
    /// - Throws: an error which causes the current test to cease executing and be marked as skipped
    open override func setUpWithError() throws {
        let testName = self.name.lowercased().trimmingCharacters(in: .punctuationCharacters)
        let foundInIncludeTags = Self.includeTags.found(in: Self.tags, orAtEndOf: testName)
        try XCTSkipUnless(foundInIncludeTags,
                          "Skipping Test -- tags not in the include list")
        let notFoundInExcludeTags = !Self.excludeTags.found(in: Self.tags, orAtEndOf: testName)
        try XCTSkipUnless(Self.excludeTags.isEmpty || notFoundInExcludeTags,
                          "Skipping Test -- tags are in the exclude list")
    }

    /// Method runs after every test to reset the state and fails the test if it exceeded the test timeout limit
    ///
    /// Resets the following:
    /// * currentScreen
    /// * testInfo
    /// * preconditions
    override open func tearDown() {
        self.waitForAnimationsToFinish()
        currentScreen = nil
        testInfo = [:]
        preconditions = [:]

        if Date().timeIntervalSince(self.testRun?.startDate ?? Date()) > TimeInterval(testTimeout) {
            XCTFail("Test duration exceeded \(testTimeout) seconds!")
        }

        super.tearDown()
    }

    /// Method runs before every test class and setups test class settings
    ///
    /// Skips all the tests in the test class if any of the include tags are NOT found in the tag list or at the end of the name of any of the tests within the test class.
    ///
    /// Sets the following:
    /// * Default KIF values
    /// * Speed of animation
    /// * Screenshot behavior
    override open class func setUp() {
        super.setUp()
        skipIfTagsNotFound()
        setDefaultKifValues()
        UIApplication.shared.keyWindow?.layer.speed = 1500

        XCTestCase.setScreenshotsBehaviour(quality: .medium, lifetime: .deleteOnSuccess)
    }

    /// Method runs after every test class
    override open class func tearDown() {
        super.tearDown()
    }

    class func skipIfTagsNotFound() {
        let noInvocationFoundWithTag = self.testInvocations.contains(where: {
            let testName = $0.selector.description.lowercased().trimmingCharacters(in: .punctuationCharacters)
            return !includeTags.found(in: tags, orAtEndOf: testName)
        })

        if noInvocationFoundWithTag {
            let testCase = BaseTestCase(invocation: self.testInvocations.first)
            testCase.record(XCTIssue.init(type: .assertionFailure, compactDescription: "Skipped - classtags: \(tags) not found in envtags: \(includeTags)"))
        }
    }

    open func waiting(for condition: @autoclosure @escaping () -> Bool, errorMessage: String, negateCondition: Bool = false, file: StaticString = #file, line: UInt = #line) {

        self.wait(for: condition(), errorMessage: errorMessage, timeout: waitingTimeout, negateCondition: negateCondition, file: file, line: line)
    }

    open func waitForAnimationsToFinish() {
        self.viewTester().waitForAnimationsToFinish()
    }

    class func setDefaultKifValues() {
        KIFTestActor.setStepDelay(0.05)
        KIFTestActor.setDefaultTimeout(validationTimeout)
        KIFTestActor.setDefaultAnimationStabilizationTimeout(0.5)
    }
}

/// Extends BaseTestCase to include instances of Swerkin objects to be used within the test cases to allow for a Gherkin-like experience.
extension BaseTestCase {
    open var Given: Steps { get { return Steps(stepType: .Given, test: self)} }
    open var When: Steps { get { return Steps(stepType: .When, test: self)} }
    open var Then: Steps { get { return Steps(stepType: .Then, test: self)} }
    open var And: Steps { get { return Steps(stepType: .And, test: self)} }
}
