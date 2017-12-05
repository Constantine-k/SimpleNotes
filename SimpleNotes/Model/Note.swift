//
//  NoteModel.swift
//  SimpleNotes
//
//  Created by Konstantin Konstantinov on 12/5/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import Foundation

class Note {
    var title: String
    var description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
