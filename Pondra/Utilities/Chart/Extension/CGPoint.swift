//
//  CGPoint.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

extension CGPoint {
    /// Calculate the "midpoint" between two points
    /// - Parameters:
    ///   - p1: Point 1
    ///   - p2: Point 2
    /// - Returns: The middle between two points
    func midPoint(other p2: CGPoint) -> CGPoint {
        return CGPoint(
            x: (self.x + p2.x) / 2,
            y: (self.y + p2.y) / 2
        )
    }

    /// Calculate the "control point" between two points. The control point is used for the quad beziercurve.
    /// The point is calculated by the midPoint +/- the difference between y of p2 and the mid point.
    /// - Parameters:
    ///   - p1: Point 1
    ///   - p2: Point 2
    /// - Returns: <#description#>
    func controlPoint(other p2: CGPoint) -> CGPoint {
        var midPoint = self.midPoint(other: p2)
        let diffY = abs(p2.y - midPoint.y)

        if self.y < p2.y {
            midPoint.y += diffY
        } else if self.y > p2.y {
            midPoint.y -= diffY
        }
        return midPoint
    }
}
