//
//  WeightRow.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 03.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct WeightRow: View {

    var weight: Weight

    var body: some View {
        HStack {
            Text(toString(weight.date))
            Spacer()
            Text("\(weight.weight, specifier: "%.1f")")
        }.padding()
    }

    func toString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM (EE)"
        return formatter.string(from: date)
    }
}

struct WeightRow_Previews: PreviewProvider {
    static var previews: some View {
        WeightRow(weight: Weight())
    }
}
