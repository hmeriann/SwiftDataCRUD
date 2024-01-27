//
//  NewBookView.swift
//  myBooks
//
//  Created by Zuleykha Pavlichenkova on 27.01.2024.
//

import SwiftUI

struct NewBookView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Book Title", text: $title)
                TextField("Author", text: $author)
                Button("Create") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || author.isEmpty)
                .navigationTitle("New Book")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    NewBookView()
}
