//
//  NoteDetail.swift
//  NotesApp
//
//  Created by Christopher Joseph on 6/15/24.
//

import SwiftUI

struct NoteDetail: View {
    
    @Binding var note: NoteModel
    @StateObject var noteApp = NoteViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Note Title", text: $note.title)
                .font(.system(size: 25))
                .fontWeight(.bold)
            TextEditor(text: $note.notesdata)
                .font(.system(size: 20))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    noteApp.saveData(note: note)
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    NoteDetail(note: .constant(NoteModel(title: "Title", notesdata: "Contents")))
}
