//
//  View.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 04.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

#if DEBUG

extension View {
    func addDebugContext() -> some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return self.environment(\.managedObjectContext, context)
    }
}

#endif
