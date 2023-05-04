/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

/// Protocol for rendering screen objects for the system under test
public protocol ScreenRenderer {
    func screen(_ screenObject: Screen, didRenderWithAuth isAuth: Bool)
}
