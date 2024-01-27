//
//  ContentView.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI

struct BookListView: View {
    // we need to present a sheet (NewBookView) on tap on + button
    @State private var createNewBook = false
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
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            // after a toolbar adding a sheet presenter depending on a state of the createNewBook property - it will present NewBookView not on the whole screen. And we need to switch createNewBook property to true, when + Button is tapped
            .sheet(isPresented: $createNewBook) {
                NewBookView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    BookListView()
}
