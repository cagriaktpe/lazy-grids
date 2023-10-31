//
//  ContentView.swift
//  lazy-grids
//
//  Created by Samet Çağrı Aktepe on 31.10.2023.
//

import SwiftUI

struct ContentView: View {
    private let items = (1...1000).map { "Item \($0)" }
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 31)
            {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 50)
                        .background(Color.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
