//
//  ContentView.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    // to access to all books create a Query macros
    @Query(sort: \Book.title) private var books: [Book]
    // we need to present a sheet (NewBookView) on tap on + button
    @State private var createNewBook = false
    var body: some View {
        NavigationStack {
            // replace VStack with the List
            List {
                ForEach(books) { book in
                    NavigationLink {
                        Text(book.title)
                    } label: {
                        HStack(spacing: 10) {
                            book.icon
                            VStack(alignment: .leading) {
                                Text(book.title).font(.title2)
                                Text(book.author).foregroundStyle(.secondary)
                                if let rating = book.rating {
                                    HStack {
                                        ForEach(0..<rating, id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .imageScale(.small)
                                                .foregroundStyle(.yellow)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
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
        .modelContainer(for: Book.self, inMemory: true)
}
