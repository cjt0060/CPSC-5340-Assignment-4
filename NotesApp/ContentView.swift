//
//  ContentView.swift
//  NotesApp
//
//  Created by Christopher Joseph on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var notesApp = NoteViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notesApp.notes) { note in
                    NavigationLink {
                        NoteDetail()
                    } label: {
                        Text(note.title)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
