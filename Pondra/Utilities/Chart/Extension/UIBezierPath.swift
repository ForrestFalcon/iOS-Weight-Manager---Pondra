//
//  UIBezierPath.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

extension UIBezierPath {
    /// Generates a quadratic curved path (bezier curve) with the given points
    /// - Parameters:
    ///   - points: Array of points
    ///   - step: Step between the points
    ///   - closedCurve: Boolean if the curve should start/end at zero
    /// - Returns: New UIBezierCurve
    static func quadCurvedPathWithPoints(points: [Double], step: CGPoint, closedCurve: Bool = false) -> UIBezierPath {
        let path = UIBezierPath()

        // Return empty path if no data is available
        if points.count < 2 {
            return path
        }

        // Calculate offset
        let offset = points.min()!

        // Add first point
        var p1 = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)

        // We have to start at point zero for a closed curve
        if closedCurve {
            path.move(to: .zero)
            path.addLine(to: p1)
        } else {
            path.move(to: p1)
        }

        for pointIndex in 1..<points.count {
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex] - offset))
            let midPoint = p1.midPoint(other: p2)

            path.addQuadCurve(to: midPoint, controlPoint: midPoint.controlPoint(other: p1))
            path.addQuadCurve(to: p2, controlPoint: midPoint.controlPoint(other: p2))

            p1 = p2
        }

        // We have to end at point zero for a closed curve
        if closedCurve {
            path.addLine(to: CGPoint(x: p1.x, y: 0))
        }

        return path
    }
}
