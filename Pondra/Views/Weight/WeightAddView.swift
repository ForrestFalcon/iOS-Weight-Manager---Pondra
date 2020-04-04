//
//  AddDataView.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 02.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct WeightAddView: View {
    @ObservedObject var viewModel: WeightAddViewModel

    @State var selectionWeight: Int = 100
    @State var selectionWeightDecimal: Int = 0
    @State var selectedDate = Date()

    init(viewModel: WeightAddViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        DatePicker(selection: self.$selectedDate, in: ...Date(), displayedComponents: .date) {
                            Text(R.string.localizable.date())
                        }
                    }
                }
                Spacer()

                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Picker(selection: self.$selectionWeight, label: Text("Numbers")) {
                            ForEach(self.viewModel.weight, id: \.self) { i in
                                Text("\(i)")
                            }
                        }
                        .frame(maxWidth: geometry.size.width / 2)
                        .clipped()

                        Picker(selection: self.$selectionWeightDecimal, label: Text("Numbers")) {
                            ForEach(self.viewModel.weightDecimal, id: \.self) { i in
                                Text(".\(i) kg")
                            }
                        }
                        .frame(maxWidth: geometry.size.width / 2)
                        .clipped()
                    }
                }
            }
            .navigationBarTitle(R.string.localizable.add_weight())
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.save(date: self.selectedDate,
                                        weight: self.selectionWeight,
                                        weightDecimal: self.selectionWeightDecimal)
                }) {
                    Text(R.string.localizable.save())
                }
            )
            .padding()
        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        WeightAddView(viewModel: WeightAddViewModel(showingModal: .constant(true)))
    }
}
