//
//  Note+CoreDataClass.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/12/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//
//

import Foundation
import CoreData


public class Note: NSManagedObject {
    
    
    
    func toDictionary() -> [String: Any] {
        
        guard
            let _id = self.id,
            let _title = self.title,
            let _content = self.content
            else {
                return [
                    "data": false
                ]
        }
        
        return [
            "id" : _id,
            "title" : _title,
            "content": _content
        ]
    }
}

