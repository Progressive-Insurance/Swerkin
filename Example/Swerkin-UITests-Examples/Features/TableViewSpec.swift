/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import Swerkin

class TableViewSpec: ExampleTestCase {
    
    private let headerLabel = TableViewScreen.View.headerLabel.accessibilityIdentifier
    private let firstCell = TableViewScreen.View.firstCell.accessibilityIdentifier
    private let secondCell = TableViewScreen.View.secondCell.accessibilityIdentifier
    private let thirdCell = TableViewScreen.View.thirdCell.accessibilityIdentifier
    
    func testIWaitToSeeScreen() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        When.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        Then.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
    }
    
    func testVerifyExistenceOfRowWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withLabel: "firstCell")
    }
    
    
    func testVerifyExistenceOfRowWithID() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withIdentifier: firstCell)
    }
    
    func testVerifyExistenceOfRowWithLabelAndID() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withIdentifier: firstCell, withLabel: "firstCell")
    }
    
    func testVerifyExistenceOfEnabledTableViewRowWithID() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withIdentifier: firstCell, isEnabled:true )
    }
    
    
    func testVerifyExistenceOfDisabledTableViewRowWithID() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withIdentifier: thirdCell, isEnabled:false )
    }
    
    func testVerifyExistenceOfEnabledTableViewRowWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withLabel: firstCell, isEnabled:true )
    }
    
    func testVerifyExistenceOfDisabledTableViewRowWithLabel() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withLabel: "thirdCell", isEnabled:false )
    }
    
    func testVerifyExistenceOfTableViewRowWithIDandTitle() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withIdentifier: firstCell, withTitle:"Apple" )
    }
    
    func testVerifyExistenceOfTableViewRowWithLabelandTitle() {
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.IWaitToSeeScreen(ExamplePresentableScreen.tableViewScreen)
        Then.IShouldSeeRow(withLabel: "secondCell", withTitle:"Mango" )
    }
    
    func testITouchRowWithLabel(){
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.ITouchRow(withLabel: "firstCell")
        Then.IWaitToSeeElement(withLabel: "Apple Clicked")
        And.ITouchElement(withLabel: "OK")
    }
    
    func testITouchRowWithID(){
        Given.IAmOnScreen(ExamplePresentableScreen.tableViewScreen)
        And.IRender(screen: ExamplePresentableScreen.tableViewScreen)
        When.ITouchRow(withIdentifier: secondCell )
        Then.IWaitToSeeElement(withLabel: "Mango Clicked")
        And.ITouchElement(withLabel: "OK")
    }
}
