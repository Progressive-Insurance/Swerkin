/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */
 
import Swerkin

class SwipeSpec: ExampleTestCase {
    
    private let scrollView = SwipeScreen.View.scrollView.accessibilityIdentifier
    
    
    func testVerifyISwipe() {
        Given.IAmOnScreen(ExamplePresentableScreen.swipeScreen)
        And.IRender(screen: ExamplePresentableScreen.swipeScreen)
        When.ISwipe(.left)
        Then.IShouldNotSeeElement(withLabel: "Right Swiped")
        And.IShouldSeeElement(withLabel: "Left Swiped")
    }
    
    func testVerifyTwoISwipes() {
        Given.IAmOnScreen(ExamplePresentableScreen.swipeScreen)
        And.IRender(screen: ExamplePresentableScreen.swipeScreen)
        And.ISwipe(.left)
        When.ISwipe(.right)
        Then.IShouldNotSeeElement(withLabel: "Left Siwped")
        And.IShouldSeeElement(withLabel: "Right Swiped")
    }
    
    func testVerifyISwipeWithIdentifier() {
        Given.IAmOnScreen(ExamplePresentableScreen.swipeScreen)
        And.IRender(screen: ExamplePresentableScreen.swipeScreen)
        And.ISwipe(.left, onElement: scrollView)
        When.ISwipe(.right, onElement: scrollView)
        Then.IShouldNotSeeElement(withLabel: "Left Siwped")
        And.IShouldSeeElement(withLabel: "Right Swiped")
    }

    func testVerifySwipeLeft() {
        Given.IAmOnScreen(ExamplePresentableScreen.swipeScreen)
        And.IRender(screen: ExamplePresentableScreen.swipeScreen)
        When.ISwipeToTheLeft()
        Then.IShouldNotSeeElement(withLabel: "Right Swiped")
        And.IShouldSeeElement(withLabel: "Left Swiped")
    }
    
    func testVerifySwipeRight() {
        Given.IAmOnScreen(ExamplePresentableScreen.swipeScreen)
        And.IRender(screen: ExamplePresentableScreen.swipeScreen)
        When.ISwipeToTheRight()
        Then.IShouldNotSeeElement(withLabel: "Left Siwped")
        And.IShouldSeeElement(withLabel: "Right Swiped")
    }
}
