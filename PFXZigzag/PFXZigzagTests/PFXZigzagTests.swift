//
//  PFXZigzagTests.swift
//  PFXZigzagTests
//
//  Created by PFXStudio on 2019. 2. 21..
//  Copyright © 2019년 PFXStudio. All rights reserved.
//

import XCTest
@testable import PFXZigzag

class PFXZigzagTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let value1 = alter_date_format()
        let value2 = bowling_score_calculator()
        let value3 = flatten_tree()
        value1.accessibilityActivate()
        value2.accessibilityActivate()
        value3.accessibilityActivate()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
