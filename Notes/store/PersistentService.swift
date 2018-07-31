//
//  PersistencyManager.swift
//  Notes
//
//  Created by Arifin Firdaus on 7/31/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import CoreData

struct PersistentService {
    
    static var shared = PersistentService()
    
    private var appDelegate: AppDelegate!
    private var managedObjectContext: NSManagedObjectContext!
    
    init() {
        // core data stuff
       
    }
    
    mutating func fetchNotes(completion: ([Note]?, Bool) -> ()) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let noteRequest: NSFetchRequest<Note> = Note.fetchRequest()
        
        do {
            let notes = try managedObjectContext.fetch(noteRequest)
            completion(notes, true)
        } catch {
            print("updateUI(): could not save data : \(error.localizedDescription)")
            completion(nil, false)
        }
    }
    
    // CoreData delete
    mutating func deleteNoteFromCoreData(note: Note, completion: (Bool) -> ()) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appDelegate.persistentContainer.viewContext
        
        managedObjectContext.delete(note)
        
        do {
            try managedObjectContext.save()
            completion(true)
        } catch {
            print("deleteNoteFromCoreData(): could not save data : \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    
    
    
    
}
