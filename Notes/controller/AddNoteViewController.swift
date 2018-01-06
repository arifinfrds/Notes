//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/6/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit
import CoreData

class AddNoteViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentLabel: UITextField!
    
    var appDelegate: AppDelegate!
    var managedObjectContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        // setup navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Resources.Color().applicationBaseColor
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        // check input field
        guard let title = titleLabel.text else { return }
        guard let content = contentLabel.text else { return }
        
        let note = Note(context: managedObjectContext)
        note.title = title
        note.content = content
        
        note.id = randomString(length: 25)
        
        do {
            try managedObjectContext.save()
            dismiss(animated: true, completion: nil)
        } catch {
            showAlertController(with: "Error", message: "Could not save data.")
            print("could not save data : \(error.localizedDescription)")
        }
        
    }
    
    func showAlertController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func randomString(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
    
    

}
