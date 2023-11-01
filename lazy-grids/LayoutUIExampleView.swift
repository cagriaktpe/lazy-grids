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
        if isMultiColumn {
            return [
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100)),
            ]
        } else {
            return [
                GridItem(.flexible(minimum: 100)),
            ]
        }
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
                    Image(systemName: isMultiColumn ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(.mint, in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                        )
                }

                ForEach(1 ... 50, id: \.self) { item in
                    Text("Item \(item)")
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
            .padding()
        }
    }
}

#Preview {
    LayoutUIExampleView()
}
