//
//  Repository.swift
//  Notes
//
//  Created by Arifin Firdaus on 8/1/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import CoreData

struct Repository {
    
    static var shared = Repository()
    
    private var appDelegate: AppDelegate!
    private var managedObjectContext: NSManagedObjectContext!
    
    init() {
        // core data stuff
        
    }
    
    mutating func requestFetchNotes(completion: ([Note]?, Bool) -> ()) {
        
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
    mutating func requestDeleteNoteFromCoreData(note: Note, completion: (Bool) -> ()) {
        
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
    
    mutating func requestSaveNote(withId id: String, title: String, content: String, completion: (Bool) -> ()) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let note = Note(context: managedObjectContext)
        note.title = title
        note.content = content
        
        note.id = RandomStringGenerator.getRandomString(length: 25)
        
        do {
            try managedObjectContext.save()
            completion(true)
        } catch {
            print("could not save data : \(error.localizedDescription)")
            completion(false)
        }
        
    }


}
