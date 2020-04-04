//
//  AddDatabaseViewModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import SwiftUI

class WeightAddViewModel: ObservableObject {
    let weight = 40 ... 150
    let weightDecimal = 0 ... 9

    @State var selectionWeight: Int = 100
    @State var selectionWeightDecimal: Int = 0

    @State var selectedDate = Date()

    let startWeight = false

    @Binding var showingModal: Bool

    init(showingModal: Binding<Bool>) {
        self._showingModal = showingModal
    }
}

extension WeightAddViewModel {
    func save() {
        let weight = Float(self.selectionWeight) + (Float(self.selectionWeightDecimal) * 0.1)

        let model = Weight()
        model.startWeight = self.startWeight
        model.date = self.selectedDate
        model.weight = weight

        showingModal.toggle()
    }
}
