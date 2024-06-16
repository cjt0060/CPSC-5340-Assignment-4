//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Christopher Joseph on 6/15/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class NoteViewModel : ObservableObject {
    
    @Published var notes = [NoteModel]()
    let db = Firestore.firestore()
    
    @MainActor
    func fetchData() async {
        self.notes.removeAll()
        do {
          let querySnapshot = try await db.collection("notes").getDocuments()
          for document in querySnapshot.documents {
              self.notes.append(try document.data(as: NoteModel.self))
          }
        } catch {
          print("Error getting documents: \(error)")
        }
    }
    
    @MainActor
    func saveData(note: NoteModel) {
        
        if let id = note.id {
                    // Edit note
                    if !note.title.isEmpty || !note.notesdata.isEmpty {
                        let docRef = db.collection("notes").document(id)
                        
                        docRef.updateData([
                            "title": note.title,
                            "notesdata" : note.notesdata
                        ]) { err in
                            if let err = err {
                                print("Error updating document: \(err)")
                            } else {
                                print("Document successfully updated")
                            }
                        }
                    }
                } else {
                    // Add note
                    if !note.title.isEmpty || !note.notesdata.isEmpty {
                        var ref: DocumentReference? = nil
                        ref = db.collection("notes").addDocument(data: [
                            "title": note.title,
                            "notesdata": note.notesdata
                        ]) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                print("Document added with ID: \(ref!.documentID)")
                            }
                        }
                    }
                }
    }
}
