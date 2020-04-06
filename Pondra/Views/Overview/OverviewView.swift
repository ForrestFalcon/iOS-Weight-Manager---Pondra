//
//  GraphView.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 04.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationView {
            GraphView(data: [10, 20, 15, 30])
                .navigationBarTitle(R.string.localizable.tab_overview())
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
