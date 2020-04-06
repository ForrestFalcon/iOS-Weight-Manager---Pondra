//
//  GraphView.swift
//  Pondra
//
//  Created by Kevin Stieglitz on 06.04.20.
//  Copyright © 2020 Kevin Stieglitz. All rights reserved.
//

import SwiftUI

struct GraphView: View {
    var data: [Double]
    var title: String?
    var price: String?

    public init(data: [Double], title: String? = nil) {
        self.data = data
        self.title = title
    }

    public var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 8) {
                Group {
                    if self.title != nil {
                        Text(self.title!)
                            .font(.title)
                    }
                }.offset(x: 0, y: 0)
                ZStack {
                    GeometryReader { chartGeo in
                        Line(data: ChartData(points: self.data),
                             frame: .constant(chartGeo.frame(in: .local)),
                             touchLocation: .constant(CGPoint(x: 100, y: 12)),
                             showIndicator: .constant(true))
                    }.frame(width: geometry.frame(in: .local).size.width, height: 200)
                }

                Spacer()
            }
        }.padding()
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(data: [10, 20, 15, 30], title: "TEST")
    }
}
