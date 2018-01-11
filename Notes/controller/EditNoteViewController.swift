//
//  EditViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/7/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import CoreData

class EditNoteViewController: UIViewController {
    
    
    // MARK: - Properites
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    var noteId: String?
    
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        updateNoteDatabase()
    }
    
    
    // MARK: - Private API's
    
    func updateNoteDatabase() {
        if let noteId = noteId {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            
            guard
                let newTitle = titleTextField.text,
                let newContent = contentTextField.text else {
                    return
            }
            // request
            let fetchNoteRequest: NSFetchRequest<Note> = Note.fetchRequest()
            
            guard let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedObjectContext) else { return }
            fetchNoteRequest.entity = entity
            
            // NSPredicate = SQL 'where' statement
            let predicate = NSPredicate(format: "id==%@", noteId)
            fetchNoteRequest.predicate = predicate

            // save
            do {
                let results = try managedObjectContext.fetch(fetchNoteRequest)
                let note = results[0]
                note.title = newTitle
                note.content = newContent
                
                try managedObjectContext.save()
            } catch {
                print("could not load data : \(error.localizedDescription)")
            }
        }
    }
    
    private func setupViews() {
        // setup navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Resources.Color().applicationBaseColor
    }
    
    
    // CoreData stuff
    
    private func updateUI() {
        
        if let noteId = noteId {
            // setup context
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = appDelegate.persistentContainer.viewContext
            
            // fetch notes where id == noteId
            let fetchNoteRequest: NSFetchRequest<Note> = Note.fetchRequest()
            fetchNoteRequest.predicate = NSPredicate(format: "id = %@", noteId)
            
            // execute fetch
            do {
                let fetchNoteResults = try managedObjectContext.fetch(fetchNoteRequest)
                let note = fetchNoteResults[0]
                
                guard
                    let title = note.title,
                    let content = note.content else {
                        return
                }
                titleTextField.text = title
                contentTextField.text = content
                
            } catch {
                print("could not load data : \(error.localizedDescription)")
            }
        }
        
    }
    
}
