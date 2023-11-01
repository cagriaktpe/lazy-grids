//
//  ContentView.swift
//  lazy-grids
//
//  Created by Samet Çağrı Aktepe on 31.10.2023.
//

import SwiftUI

struct ContentView: View {
    private let items = (1...50).map { "Item \($0)" }
    
    private let columns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(50)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(
                rows: columns,
                alignment: .top,
                spacing: 32,
                pinnedViews: .sectionHeaders
            )
            {
                Section {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 50)
                            .background(Color.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Section 1")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.mint)
                }
                
                Section {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 50)
                            .background(Color.red, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                } header: {
                    Text("Section 2")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
