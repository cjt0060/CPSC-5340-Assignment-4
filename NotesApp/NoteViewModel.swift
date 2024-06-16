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
    
    func saveData(note: NoteModel) {
        
    }
}
