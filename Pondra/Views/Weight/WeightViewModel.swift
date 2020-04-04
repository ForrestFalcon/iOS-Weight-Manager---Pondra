//
//  WeightViewModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import RealmSwift
import Combine
import SwiftUI

class WeightViewModel: ObservableObject {
    @ObservedObject var weights = BindableResults(results: try! Realm().objects(Weight.self))
}

extension WeightViewModel {
    func delete(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }

        log.info("Delete Weight at index \(index)")
        let weight = self.weights.results[index]
        log.info(weight)

        let realm = try! Realm()
        try! realm.write {
            realm.delete(weight)
        }
    }
}
