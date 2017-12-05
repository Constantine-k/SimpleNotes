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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFieldsStyles()
        
        // Add tap gesture recognizer for hiding keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
