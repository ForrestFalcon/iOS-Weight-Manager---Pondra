//
//  DatabaseView.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 02.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    @ObservedObject var viewModel = WeightViewModel()
    @State var showingAddModal = false

    var body: some View {
        NavigationView {
            List {
                Text("TEST")
//                ForEach(self.viewModel.weights.results.keyedEnumeration) { key in
//                    Text(key.id)
//                }
//                .onDelete { index in
//                    self.viewModel.delete(at: index)
//                }
            }
            .navigationBarTitle(R.string.localizable.tab_database())
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        self.showingAddModal.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
//                    EditButton()
                }
            )
        }.sheet(isPresented: self.$showingAddModal) {
            WeightAddView(viewModel: WeightAddViewModel(showingModal: self.$showingAddModal))
        }
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
