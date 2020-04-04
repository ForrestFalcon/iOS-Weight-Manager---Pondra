//
//  DatabaseView.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 02.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: WeightItem.getAllWeightItems()) var weightItems: FetchedResults<WeightItem>

    @ObservedObject var viewModel = WeightViewModel()
    @State var showingAddModal = false

    var body: some View {
        NavigationView {
            List {
                ForEach(self.weightItems) { item in
                    WeightRow(weight: item)
                }
                .onDelete { self.deleteItem(at: $0) }
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

    func deleteItem(at offsets: IndexSet) {
        guard let index = offsets.first else {
            return
        }
        let deleteItem = self.weightItems[index]
//        viewModel.delete(item: deleteItem)

        self.context.delete(deleteItem)
        do {
            try self.context.save()
        } catch {
            log.error(error)
        }
    }
}

struct DatabaseView_Previews: PreviewProvider {
    static var previews: some View {
        return WeightView().addDebugContext()
    }
}
