//
//  Line.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

public struct Line: View {
    @ObservedObject var data: ChartData

    @Binding var frame: CGRect
    @Binding var touchLocation: CGPoint
    @Binding var showIndicator: Bool

    @State private var showFull: Bool = false
    @State var showBackground: Bool = true

    var gradient: GradientColor = GradientColors.blue
    var backgroundGradient: GradientColor = GradientColors.blueWhite

    var index: Int = 0
    let padding: CGFloat = 30
    var curvedLines: Bool = false

    var stepWidth: CGFloat {
        if data.points.count < 2 {
            return 0
        }
        return frame.size.width / CGFloat(data.points.count - 1)
    }

    var stepHeight: CGFloat {
        var min: Double?
        var max: Double?
        let points = data.onlyPoints()

        if let minPoint = points.min(), let maxPoint = points.max(), minPoint != maxPoint {
            min = minPoint
            max = maxPoint
        } else {
            return 0
        }

        if let min = min, let max = max, min != max {
            if min <= 0 {
                return (frame.size.height - padding) / CGFloat(max - min)
            } else {
                return (frame.size.height - padding) / CGFloat(max + min)
            }
        }
        return 0
    }

    var path: Path {
        let points = data.onlyPoints()
        return curvedLines
            ? Path(UIBezierPath.quadCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight)).cgPath)
            : Path.linePathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight))
    }

    var closedPath: Path {
        let points = data.onlyPoints()
        return curvedLines
            ? Path(UIBezierPath.quadCurvedPathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight), closedCurve: true).cgPath)
            : Path.linePathWithPoints(points: points, step: CGPoint(x: stepWidth, y: stepHeight), closedCurve: true)
    }

    public var body: some View {
        ZStack {
            // Show background gradient
            if self.showFull && self.showBackground {
                self.closedPath
                    .fill(LinearGradient(gradient: backgroundGradient.getGradient(), startPoint: .bottom, endPoint: .top))
                    .rotationEffect(.degrees(180), anchor: .center)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .transition(.opacity)
                    .animation(.easeIn(duration: 1.6))
            }

            self.path
                .trim(from: 0, to: self.showFull ? 1 : 0)
                .stroke(LinearGradient(gradient: gradient.getGradient(), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 3, lineJoin: .round))
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .animation(Animation.easeOut(duration: 1.2).delay(Double(self.index) * 0.4))
                .onAppear {
                    self.showFull = true
                }
                .onDisappear {
                    self.showFull = false
                }
                .drawingGroup()

            // Indicator dot
//            if self.showIndicator {
//                IndicatorPoint()
//                    .position(self.getClosestPointOnPath(touchLocation: self.touchLocation))
//                    .rotationEffect(.degrees(180), anchor: .center)
//                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
//            }
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            Line(data: ChartData(points: [12, -230, 10, 54]),
                 frame: .constant(geometry.frame(in: .local)),
                 touchLocation: .constant(CGPoint(x: 100, y: 12)),
                 showIndicator: .constant(true))
        }.frame(width: 320, height: 160)
    }
}
