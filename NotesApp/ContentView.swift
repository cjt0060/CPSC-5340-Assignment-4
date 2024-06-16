//
//  ContentView.swift
//  NotesApp
//
//  Created by Christopher Joseph on 6/15/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @StateObject var notesApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($notesApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.title)
                    }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text("New Note")
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            
        }
        .task {
            await notesApp.fetchData()
        }
        .refreshable {
            await notesApp.fetchData()
        }
        Spacer()
        NavigationLink(destination: AuthView()) {
            Text("Logout")
                .foregroundColor(.red)
                .font(.system(size: 20))
                .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
