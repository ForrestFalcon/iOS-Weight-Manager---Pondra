//
//  CGPointTests.swift
//  PondraTests
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

@testable import Pondra
import XCTest

class CGPointTests: XCTestCase {
    func testMidPoint_withPositiveValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: 10, y: 20)

        let midPoint = p1.midPoint(other: p2)
        let correctPoint = CGPoint(x: 7.5, y: 15)

        XCTAssertEqual(midPoint, correctPoint)
    }

    func testMidPoint_withNegativeValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: -10, y: -20)

        let midPoint = p1.midPoint(other: p2)
        let correctPoint = CGPoint(x: -2.5, y: -5.0)

        XCTAssertEqual(midPoint, correctPoint)
    }

    func testMidPoint_withSameValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: 10, y: 10)

        let midPoint = p1.midPoint(other: p2)
        let correctPoint = CGPoint(x: 7.5, y: 10)

        XCTAssertEqual(midPoint, correctPoint)
    }

    func testControlPoint_withPositiveValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: 10, y: 20)

        // diff is p2.y - ((p1.y + p2.y)/2) = 20 - 15 = 5
        // midPoint.y += 5 = 20

        let midPoint = p1.controlPoint(other: p2)
        let correctPoint = CGPoint(x: 7.5, y: 20.0)

        XCTAssertEqual(midPoint, correctPoint)
    }

    func testControlPoint_withNegativeValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: -10, y: -20)

        // diff abs is p2.y - ((p1.y + p2.y)/2) = abs(-20 - -5) = 15
        // midPoint.y -= 15 = -20

        let midPoint = p1.controlPoint(other: p2)
        let correctPoint = CGPoint(x: -2.5, y: -20.0)

        XCTAssertEqual(midPoint, correctPoint)
    }

    func testControlPoint_withSameValues() throws {
        let p1 = CGPoint(x: 5, y: 10)
        let p2 = CGPoint(x: 10, y: 10)

        let midPoint = p1.controlPoint(other: p2)
        let correctPoint = CGPoint(x: 7.5, y: 10)

        XCTAssertEqual(midPoint, correctPoint)
    }
}
