//
//  ContentView.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    // to Delete from the DB we need the access to the context, so we add the env property and assign it to a variable context. We will use this variable to delete that book in .onDelete function
    @Environment(\.modelContext) private var context
    // to access to all books create a Query macros
    @Query(sort: \Book.title) private var books: [Book]
    // we need to present a sheet (NewBookView) on tap on + button
    @State private var createNewBook = false
    var body: some View {
        NavigationStack {
            Group {
                if books.isEmpty {
                    ContentUnavailableView(
                        "Enter your first book.",
                        systemImage: "book.fill"
                    )
                } else {
                    // VStack replaced with the List
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
                        // since we use ForEach loop, we can use the .onDelete function. It gives us aaccess to the indexSet that we swipe on
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let book = books[index]
                                context.delete(book)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
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
