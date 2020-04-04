//
//  AddDatabaseViewModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

class WeightAddViewModel: ObservableObject, ViewContextFetcher {
    let weight = 40 ... 150
    let weightDecimal = 0 ... 9

    let startWeight = false

    @Binding var showingModal: Bool

    init(showingModal: Binding<Bool>) {
        self._showingModal = showingModal
    }
}

extension WeightAddViewModel {
    func save(date: Date, weight: Int, weightDecimal: Int) {
        let weight = Float(weight) + (Float(weightDecimal) * 0.1)

        let model = WeightItem(context: self.context)
        model.startWeight = self.startWeight
        model.date = date
        model.weight = weight

        do {
            try self.context.save()
        } catch {
            log.error(error)
        }

        self.showingModal.toggle()
    }
}
