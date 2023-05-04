/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

extension Steps {

    /// Touch button with given accessibility identifier
    /// - Parameters:
    ///   - buttonId: accessibility identifier
    public func ITouchButton(_ buttonId: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId]) {
            self.touchButton(withIdentifier: buttonId, file: file, line: line)
        }
    }

    /// Touch button with given accessibility label
    /// - Parameters:
    ///   - withLabel: accessibility label
    public func ITouchButton(withLabel buttonLabel: String, file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonLabel]) {
            self.touchButton(withLabel: buttonLabel, file: file, line: line)
        }
    }

    /// Touch button with given accessibility identifier and accessibility label
    /// - Parameters:
    ///   - buttonId: accessibility identifier
    ///   - withLabel: accessibility label
    public func ITouchButton(_ buttonId: String, withLabel buttonLabel: String,
                             file: StaticString = #file, line: UInt = #line) {
        self.performStep([buttonId]) {
            self.touchButton(withIdentifier: buttonId, withLabel: buttonLabel, file: file, line: line)
        }
    }
}
