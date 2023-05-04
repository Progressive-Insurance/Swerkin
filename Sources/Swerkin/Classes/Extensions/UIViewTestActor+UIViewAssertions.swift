/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

import KIF

extension KIFUIViewTestActor {

    func viewExists(withLabel label: String) -> Bool {
        return self.usingLabel(label).tryFindingView()
    }

    func viewExists(withIdentifier identifier: String) -> Bool {
        return self.usingIdentifier(identifier).tryFindingView()
    }

    func viewExists(withAccessibilityValue value: String) -> Bool {
        return self.usingValue(value).tryFindingView()
    }

    func viewExistsWithLabelPrefix(_ prefix: String) -> Bool {
        return view(withLabelPrefix: prefix) != nil
    }

    func viewExistsWithLabelSuffix(_ suffix: String) -> Bool {
        return view(withLabelSuffix: suffix) != nil
    }

    func viewExistsWithIdentifierPrefix(_ prefix: String) -> Bool {
        return view(withIdentifierPrefix: prefix) != nil
    }

    func viewExistsWithIdentifierSuffix(_ suffix: String) -> Bool {
        return view(withIdentifierSuffix: suffix) != nil
    }

    func viewExists(andLabelContains expectedValue: String) -> Bool {
        return view(andLabelContains: expectedValue) != nil
    }
}
