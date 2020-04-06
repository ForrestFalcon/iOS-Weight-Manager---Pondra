//
//  HapticFeedback.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

class HapticFeedback {
    #if os(watchOS)
    // watchOS implementation
    static func playSelection() {
        WKInterfaceDevice.current().play(.click)
    }

    #else
    // iOS implementation
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    static func playSelection() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    #endif
}
