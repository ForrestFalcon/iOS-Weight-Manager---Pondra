//
//  BaseViewModel.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 04.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import CoreData
import Foundation
import SwiftUI

protocol ViewContextFetcher {
    var context: NSManagedObjectContext { get }
}

extension ViewContextFetcher {
    var context: NSManagedObjectContext {
        get {
             return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
    }
}
