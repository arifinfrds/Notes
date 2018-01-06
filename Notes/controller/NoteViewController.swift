//
//  NoteViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/6/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    
    
     // MARK: - Properties
    
    @IBOutlet var noteTableView: UITableView!
    
    var appDelegate: AppDelegate!
    var managedObjectContext: NSManagedObjectContext!

    var notes = [Note]()
    
    
    // MARK: - View life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        noteTableView.dataSource = self
        noteTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    
    // MARK: - Private API's
    
    private func updateUI() {
        // core data stuff
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let noteRequest: NSFetchRequest<Note> = Note.fetchRequest()
        
        do {
            try notes = managedObjectContext.fetch(noteRequest)
            noteTableView.reloadData()
        } catch {
            print("could not save data : \(error.localizedDescription)")
        }
    }
    
    private func setupViews() {
        // setup navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Resources.Color().applicationBaseColor
        
        // setup cell
        let nib = UINib(nibName: "NoteCell", bundle: nil)
        noteTableView.register(nib, forCellReuseIdentifier: "note_cell")
    }
    
}


// MARK - UITableViewDataSource

extension NoteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note_cell", for: indexPath) as! NoteCell
        cell.dataSource = notes[indexPath.row]
        return cell
    }
}
