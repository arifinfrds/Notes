//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/12/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var content: String?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    
    convenience init(id: String?, title: String?, content: String?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedObjectContext)
        
        self.init(entity: entity!, insertInto: managedObjectContext)
        
        self.id = id
        self.title = title
        self.content = content
    }
    

}
