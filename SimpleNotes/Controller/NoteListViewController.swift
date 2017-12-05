//
//  ViewController.swift
//  SimpleNotes
//
//  Created by Konstantin Konstantinov on 12/4/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var noteTable: UITableView!
    
    /// Notes model
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register a cell for returning in the correct type
        noteTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // UITableViewDataSource conformance methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].description
        
        return cell
    }
    
}
