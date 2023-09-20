/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */
import XCTest

extension Steps {

    /// Verify table cell row with a given accessibility id appears on the screen
    /// - Parameters:
    ///   - withIdentifier: accessibility id of table cell
    public func IShouldSeeRow(withIdentifier cellId: String) {
        self.performStep([cellId]) {
            XCTAssertTrue(self.tableCellExists(withIdentifier: cellId), "Table Cell: \(cellId) not found")
        }
    }

    /// Verify table cell row with a given accessibility label appears on the screen
    /// - Parameters:
    ///   - withLabel: accessibility label of table cell
    public func IShouldSeeRow(withLabel cellName: String) {
        self.performStep([cellName]) {
            XCTAssertTrue(self.tableCellExists(withLabel: cellName), "Table Cell: \(cellName) not found")
        }
    }

    /// Verify table cell row with a given accessibility id and label appears on the screen
    /// - Parameters:
    ///   - withIdentifier: accessibility id of table cell
    ///   - withLabel: accessibility label of table cell
    public func IShouldSeeRow(withIdentifier cellId: String, withLabel cellName: String) {
        self.performStep([cellId, cellName]) {
            XCTAssertTrue(self.tableCellExists(withIdentifier: cellId, withLabel: cellName), "Table Cell: \(cellId) with label: \(cellName) not found")
        }
    }

    /// Verify table cell row with a given accessibility id appears and is enabled or disabled based on the isEnabled flag
    /// - Parameters:
    ///   - withIdentifier: accessibility id of table cell
    ///   - isEnabled: Bool
    public func IShouldSeeRow(withIdentifier cellId: String, isEnabled: Bool) {
        self.performStep([cellId, String(isEnabled)]) {
            IShouldSeeRow(withIdentifier: cellId)
            if isEnabled {
                XCTAssertTrue(self.elementIsTappable(withLabel: cellId), "Table Cell: \(cellId) is not enabled")
            } else {
                XCTAssertFalse(self.elementIsTappable(withLabel: cellId), "Table Cell: \(cellId) is enabled")
            }
        }
    }

    /// Verify table cell row with a given accessibility label appears and is enabled or disabled based on the isEnabled flag
    /// - Parameters:
    ///   - withLabel: accessibility label of table cell
    ///   - isEnabled: Bool
    public func IShouldSeeRow(withLabel cellName: String, isEnabled: Bool) {
        self.performStep([cellName, String(isEnabled)]) {
            IShouldSeeRow(withLabel: cellName)
            if isEnabled {
                XCTAssertTrue(self.elementIsTappable(withLabel: cellName), "Table Cell: \(cellName) is not enabled")
            } else {
                XCTAssertFalse(self.elementIsTappable(withLabel: cellName), "Table Cell: \(cellName) is enabled")
            }
        }
    }

    /// Verify table cell row with a given accessibility id appears on the screen with a given text
    /// - Parameters:
    ///   - withIdentifier: accessibility id of table cell
    ///   - withTitle: text displayed in table cell
    public func IShouldSeeRow(withIdentifier cellId: String, withTitle text: String) {
        self.performStep([cellId, text]) {
            guard let row: UITableViewCell = self.element(withIdentifier: cellId) as? UITableViewCell else {
                XCTFail("Could not find row: \(cellId)")
                return
            }
            if let title = row.textLabel?.text {
                XCTAssertTrue(title == text, "Expected: \(text), Actual: \(String(describing: title))")
            } else {
                let title = ""
                XCTAssertTrue(title == text, "Expected: \(text), Actual: \(String(describing: title))")
            }
        }
    }

    /// Verify table cell row with a given accessibility label appears on the screen with a given text
    /// - Parameters:
    ///   - withLabel: accessibility label of table cell
    ///   - withTitle: text displayed in table cell
    public func IShouldSeeRow(withLabel cellName: String, withTitle text: String) {
        self.performStep([cellName, text]) {
            guard let row: UITableViewCell = self.element(withLabel: cellName) as? UITableViewCell else {
                XCTFail("Could not find row: \(cellName)")
                return
            }
            if let title = row.textLabel?.text {
                XCTAssertTrue(title == text, "Expected: \(text), Actual: \(String(describing: title))")
            } else {
                let title = ""
                XCTAssertTrue(title == text, "Expected: \(text), Actual: \(String(describing: title))")
            }
        }
    }
}
