//
//  myBooksApp.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI
import SwiftData

@main
struct myBooksApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        // a SwiftData method to access the model container
        .modelContainer(for: Book.self)
    }
    
    init() {
        // prints a path where the model is stored (a place where to find a default.store file)
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
