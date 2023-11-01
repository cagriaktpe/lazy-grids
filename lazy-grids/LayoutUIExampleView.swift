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
        Array(repeating: .init(.flexible()), count: isMultiColumn ? 2 : 1)
    }

    var body: some View {
        ScrollView {
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
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
            LazyVGrid(
                columns: columns,
                alignment: .trailing,
                spacing: 16
            ) {
                ForEach(1 ... 50, id: \.self) { item in
                    Text("Item \(item)")
                        .frame(height: isMultiColumn ? 100 : 50)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
            .animation(.spring(), value: isMultiColumn)
            .padding()
        }
    }
}

#Preview {
    LayoutUIExampleView()
}
