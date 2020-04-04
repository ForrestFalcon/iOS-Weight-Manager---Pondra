//
//  WeightItem.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 04.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import CoreData
import Foundation

public class WeightItem: NSManagedObject, Identifiable {
    @NSManaged public var date: Date
    @NSManaged public var startWeight: Bool
    @NSManaged public var weight: Float
}

extension WeightItem {
    static func getAllWeightItems() -> NSFetchRequest<WeightItem> {
        let request: NSFetchRequest<WeightItem> = WeightItem.fetchRequest() as! NSFetchRequest<WeightItem>

        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]

        return request
    }
}
