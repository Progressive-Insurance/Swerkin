/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */


/// Base list of TestTags to use to organize the tests suites
///
/// Extend the struct in specific projects to expand the list of test tags to use
public struct TestTag: RawRepresentable, Equatable {
    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue.lowercased()
    }

    public static let all = TestTag(rawValue: "all")
    public static let smoke = TestTag(rawValue: "smoke")
    public static let regression = TestTag(rawValue: "regression")
    public static let retired = TestTag(rawValue: "retired")
}

extension ProcessInfo {
    /// Get list of test tags from the named environment variable
    /// - Parameter name: Environment variable to get the list of test tags from
    /// - Returns: List of test tags
    public func getListOfTags(from name: String) -> [TestTag] {
        let tagList = self.environment[name] ?? ""
        return tagList.split(separator: ",")
            .compactMap { TestTag(rawValue: $0.lowercased()) }
    }
}

extension Array where Element == TestTag {
    /// Determine if test tag is found in a given list of test tags or at the end of a name
    /// - Parameters:
    ///   - tags: List of test tags to look through for the test tag
    ///   - name: Name to look at for the test tag
    /// - Returns: Boolean - true it was found, false it was not found
    public func found(in tags: [TestTag], orAtEndOf name: String) -> Bool {
        guard !self.isEmpty, !self.contains(.all) else { return true }
        return self.contains(where: { tags.contains($0) }) ||
            self.contains(where: { name.hasSuffix( $0.rawValue ) })
    }
}
