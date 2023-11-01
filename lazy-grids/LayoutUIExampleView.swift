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
            GridItem(.flexible()),
        ]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .trailing,
                spacing: 16
            ) 
            {
                Button {
                    isMultiColumn.toggle()
                } label: {
                    Text("Toggle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                }
                
                ForEach(1...50, id: \.self) { item in
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
