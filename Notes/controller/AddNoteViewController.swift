//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/6/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentLabel: UITextField!
    
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
        
        // check input field
        guard let title = titleLabel.text else { return }
        guard let content = contentLabel.text else { return }
        
        // TODO: - core data stuff
        
        
        // dismiss(animated: true, completion: nil)
    }
    
    

}
