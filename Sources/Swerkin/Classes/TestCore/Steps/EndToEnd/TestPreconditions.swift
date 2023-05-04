/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

public struct PreconditionKey: RawRepresentable, Equatable, Hashable {

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }

    public static let loggedIn  = PreconditionKey(rawValue: "loggedIn")
}
