//
//  AddingNoteViewController.swift
//  SimpleNotes
//
//  Created by Konstantin Konstantinov on 12/5/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class AddingNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteDescription: UITextView!
    
    var noteReceivingDelegate: NoteReceivable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFieldsStyles()
        
        // Add tap gesture recognizer for hiding keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func saveButtonTouch(_ sender: UIBarButtonItem) {
        guard let noteTitle = noteTitle.text,
            let noteDescription = noteDescription.text else { return }
        
        if !noteTitle.isEmpty {
            noteReceivingDelegate?.receiveNote(Note(title: noteTitle, description: noteDescription))
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func setFieldsStyles() {
        noteTitle.layer.borderColor = UIColor.gray.cgColor;
        noteTitle.layer.borderWidth = 0.5;
        noteTitle.layer.cornerRadius = 5.0;
        
        noteDescription.layer.borderColor = UIColor.gray.cgColor;
        noteDescription.layer.borderWidth = 0.5;
        noteDescription.layer.cornerRadius = 5.0;
    }
    
    @objc func hideKeyboard() {
        noteTitle.endEditing(true)
        noteDescription.endEditing(true)
    }
    
}

protocol NoteReceivable {
    func receiveNote(_ note: Note)
}
