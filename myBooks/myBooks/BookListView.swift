//
//  ContentView.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI

struct BookListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("My Books")
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    BookListView()
}
