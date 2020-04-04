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

    init(viewModel: WeightAddViewModel) {
        self.viewModel = viewModel
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        DatePicker(selection: self.viewModel.$selectedDate, in: ...Date(), displayedComponents: .date) {
                            Text(R.string.localizable.date())
                        }
                    }
                }
                Spacer()
                WeightPicker(viewModel: self.viewModel)
            }
            .navigationBarTitle(R.string.localizable.add_weight())
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.save()

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

struct WeightPicker: View {
    var viewModel: WeightAddViewModel

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker(selection: self.viewModel.$selectionWeight, label: Text("Numbers")) {
                    ForEach(self.viewModel.weight, id: \.self) { i in
                        Text("\(i)")
                    }
                }
                .frame(maxWidth: geometry.size.width / 2)
                .clipped()

                Picker(selection: self.viewModel.$selectionWeightDecimal, label: Text("Numbers")) {
                    ForEach(self.viewModel.weightDecimal, id: \.self) { i in
                        Text(".\(i) kg")
                    }
                }
                .frame(maxWidth: geometry.size.width / 2)
                .clipped()
            }
        }
    }
}
