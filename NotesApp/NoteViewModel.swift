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
    
    @Published private(set) var notes = [NoteModel]()
    
    func fetchData() {
        
    }
}
