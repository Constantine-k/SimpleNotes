//
//  ViewController.swift
//  SimpleNotes
//
//  Created by Konstantin Konstantinov on 12/4/17.
//  Copyright © 2017 Konstantin Konstantinov. All rights reserved.
//

import UIKit
import CoreData

class NoteListViewController: UIViewController, UITableViewDataSource, NoteReceivable {

    @IBOutlet weak var noteTable: UITableView!
    
    var persistentContainer: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    /// Notes model
    var notes = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let managedContext = persistentContainer?.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "NoteData")
        
        do {
            notes = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    // MARK: - UITableViewDataSource conformance methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        cell.textLabel?.text = note.value(forKeyPath: "title") as? String
        cell.detailTextLabel?.text = note.value(forKeyPath: "text") as? String
        
        return cell
    }
    
    // MARK: - Note receiving and saving
    
    /// Note receiving delegate method
    func receive(note: Note) {
        save(note: note)
        noteTable.reloadData()
    }
    
    /// Save note using Core Data
    func save(note: Note) {
        guard let managedContext = persistentContainer?.viewContext else { return }
        
        let entity = NSEntityDescription.entity(forEntityName: "NoteData", in: managedContext)!
        let noteObject = NSManagedObject(entity: entity, insertInto: managedContext)
        
        noteObject.setValue(note.title, forKeyPath: "title")
        noteObject.setValue(note.description, forKeyPath: "text")
        
        do {
            try managedContext.save()
            notes.append(noteObject)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToAddingNote" {
            if let destinationVC = segue.destination as? AddingNoteViewController {
                destinationVC.noteReceivingDelegate = self
            }
        }
    }
}
