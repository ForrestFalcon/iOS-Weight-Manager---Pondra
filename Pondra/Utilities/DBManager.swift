//
//  DBManager.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {

    // MARK: Singleton

    static let sharedInstance = DBManager()

    // MARK: Init

    private init() {
        do {
            let realm = try Realm()
        } catch let error as NSError {
            // handle error
            print(error)
        }
    }
}
