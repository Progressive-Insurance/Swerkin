/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

public protocol Viewable {
    func element(withIdentifier identifier: String) -> UIView?
    func element(withLabel label: String) -> UIView?
    func allElements(withIdentifier identifier: String) -> [UIView]
    func allElements(withIdentifierPrefix prefix: String) -> [UIView]
    func allLabels(for element: UIView) -> [String]
    func allValues(for element: UIView) -> [String]
    func allNestedSubviews(_ parent: UIView) -> [UIView]
}
