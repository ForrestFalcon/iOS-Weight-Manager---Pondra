//
//  Results.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 04.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import RealmSwift

typealias Model = Object & Identifiable

struct ListKey<T: Model>: Identifiable {
    let id: T.ID
}

extension Results where Element: Model {

    subscript(key: ListKey<Element>) -> Element? {
        Element.primaryKey().flatMap { self.filter("\($0) = %@", key.id).first }
    }

    var keyedEnumeration: [ListKey<Element>] {
        guard let key = Element.primaryKey() else { return [] }
        let keys = value(forKey: key) as! [Element.ID]
        return keys.enumerated().map { ListKey(id: $0.1) }
    }
}
