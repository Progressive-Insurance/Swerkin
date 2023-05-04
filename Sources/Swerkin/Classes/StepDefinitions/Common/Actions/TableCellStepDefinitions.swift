/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Touch table cell row with a given id
    /// - Parameters:
    ///   - withIdentifier: accessibility id of table cell
    public func ITouchRow(withIdentifier tableCellId: String) {
        self.performStep([tableCellId]) {
            guard let _: UITableViewCell = self.element(withIdentifier: tableCellId) as? UITableViewCell else {
                XCTFail("Could not find row: \(tableCellId)")
                return
            }
            self.ITouchElement(withLabel: tableCellId)
        }
    }

    /// Touch table cell row with a given name
    /// - Parameters:
    ///   - withLabel: accessibility label of table cell
    public func ITouchRow(withLabel tableCellName: String) {
        self.performStep([tableCellName]) {
            guard let _: UITableViewCell = self.element(withLabel: tableCellName) as? UITableViewCell else {
                XCTFail("Could not find row: \(tableCellName)")
                return
            }
            self.ITouchElement(withLabel: tableCellName)
        }
    }
}
