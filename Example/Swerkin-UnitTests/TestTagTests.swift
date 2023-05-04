/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import XCTest
import Swerkin

class TestTagTests: XCTestCase {

    func testWhenTestTagsHasAllFoundIsTrue() {
        let testTags = [TestTag(rawValue: "all")]
        let myTags = [TestTag(rawValue: "apples")]
        let name = "testMyTest"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsHasAllNotFoundIsFalse() {
        let testTags = [TestTag(rawValue: "all")]
        let myTags = [TestTag(rawValue: "apples")]
        let name = "testMyTest"
        
        XCTAssertFalse(!testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsIsEmptyFoundIsTrue() {
        let testTags = [TestTag(rawValue: "")]
        let myTags = [TestTag(rawValue: "apples")]
        let name = "testMyTest"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsMatchesMyTagFoundIsTrue() {
        let testTags = [TestTag(rawValue: "apples")]
        let myTags = [TestTag(rawValue: "apples")]
        let name = "testMyTest"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsContainsOneOfMyTagsFoundIsTrue() {
        let testTags = [TestTag(rawValue: "apples")]
        let myTags = [TestTag(rawValue: "apples"),TestTag(rawValue: "smoke")]
        let name = "testMyTest"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsContainsMyTagFoundIsTrue() {
        let testTags = [TestTag(rawValue: "apples"), TestTag(rawValue: "smoke")]
        let myTags = [TestTag(rawValue: "apples")]
        let name = "testMyTest"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsInNameFoundIsTrue() {
        let testTags = [TestTag(rawValue: "smoke"),TestTag(rawValue: "apples")]
        let myTags = [TestTag(rawValue: "oranges")]
        let name = "testmytest_smoke"
        
        XCTAssertTrue(testTags.found(in: myTags, orAtEndOf: name))
    }
    
    func testWhenTestTagsNotInNameFoundIsFalse() {
        let testTags = [TestTag(rawValue: "smoke"),TestTag(rawValue: "apples")]
        let myTags = [TestTag(rawValue: "oranges")]
        let name = "testmytest"
        
        XCTAssertFalse(testTags.found(in: myTags, orAtEndOf: name))
    }
}
