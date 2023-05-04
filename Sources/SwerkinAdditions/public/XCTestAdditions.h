/*
 @license
 Copyright 2023 Progressive Casualty Insurance Company.
 
 All Rights Reserved.Use of this source code is governed by an MIT license that can be found in the LICENSE file at https://github.com/Progressive/Swerkin/LICENSE.md
 */

//#ifndef XCTestAdditions_h
//#define XCTestAdditions_h
//
//
//#endif /* XCTestAdditions_h */
typedef BOOL(^TestCondition)(void);

// More convenient for Swift to have a trailing block
FOUNDATION_EXTERN BOOL WaitForConditionWithTimeout(NSTimeInterval timeout, TestCondition condition);

#define PSPDF_DEPRECATED_NOWARN(expression) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
expression \
_Pragma("clang diagnostic pop")
