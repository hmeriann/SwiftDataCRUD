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
        .modelContainer(for: Book.self)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
