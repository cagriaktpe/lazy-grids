//
//  LayoutUIExampleView.swift
//  lazy-grids
//
//  Created by Samet Çağrı Aktepe on 1.11.2023.
//

import SwiftUI

struct LayoutUIExampleView: View {
    @State private var isMultiColumn: Bool = false

    private var columns: [GridItem] {
        [
            GridItem(.fixed(100)),
        ]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .trailing,
                spacing: 16
            ) {
                Button {
                    isMultiColumn.toggle()
                } label: {
                    Text("Toggle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LayoutUIExampleView()
}
