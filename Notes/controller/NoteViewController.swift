//
//  NoteViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/6/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    @IBOutlet var noteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        noteTableView.dataSource = self
        
    }
    
    func setupViews() {
        // setup navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Resources.Color().applicationBaseColor
        
        // setup cell
        let nib = UINib(nibName: "NoteCell", bundle: nil)
        noteTableView.register(nib, forCellReuseIdentifier: "note_cell")
    }
    
    @IBAction func addNote(_ sender: Any) {
        
    }
    
}

extension NoteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "note_cell", for: indexPath) as! NoteCell
        
        return cell
    }
}
