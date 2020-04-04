//
//  WeightModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import RealmSwift

class Weight: Object, Identifiable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var date = Date()
    @objc dynamic var weight: Float = 0.0
    @objc dynamic var startWeight = false

    override static func primaryKey() -> String? {
        return "id"
    }
}
