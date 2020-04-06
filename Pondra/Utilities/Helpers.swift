//
//  Helpers.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

public struct Colors {
    public static let LegendColor: Color = Color(hexString: "#E8E7EA")
    
    public static let IndicatorKnob: Color = Color(hexString: "#FF57A6")

    public static let GradientPurple: Color = Color(hexString: "#7B75FF")
    public static let GradientNeonBlue: Color = Color(hexString: "#6FEAFF")
}

public struct GradientColor {
    public let start: Color
    public let end: Color

    init(start: Color, end: Color) {
        self.start = start
        self.end = end
    }

    public func getGradient() -> Gradient {
        return Gradient(colors: [self.start, self.end])
    }
}

public struct GradientColors {
    public static let blue = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    public static let blueWhite = GradientColor(start: Colors.GradientPurple, end: Color.white)
}
