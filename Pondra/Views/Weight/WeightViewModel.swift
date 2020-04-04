//
//  WeightViewModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class WeightViewModel: ObservableObject {
    
}

extension WeightViewModel: ViewContextFetcher {
    func delete(item: WeightItem) {
        log.info("Delete Weight item")
        log.info(item)

        self.context.delete(item)
        do {
            try self.context.save()
        } catch {
            log.error(error)
        }
    }
}
