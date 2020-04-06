//
//  Path
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

extension Path {
    static func linePathWithPoints(points: [Double], step: CGPoint, closedCurve: Bool = false) -> Path {
        var path = Path()

        if points.count < 2 {
            return path
        }

        guard let offset = points.min() else { return path }

        var line = CGPoint(x: 0, y: CGFloat(points[0] - offset) * step.y)

        if closedCurve {
            path.move(to: .zero)
            path.addLine(to: line)
        } else {
            path.move(to: line)
        }

        for pointIndex in 1..<points.count {
            line = CGPoint(x: step.x * CGFloat(pointIndex), y: step.y * CGFloat(points[pointIndex] - offset))
            path.addLine(to: line)
        }

        if closedCurve {
            path.addLine(to: CGPoint(x: line.x, y: 0))
        }

        return path
    }
}
