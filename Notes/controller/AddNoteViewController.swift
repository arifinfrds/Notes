//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/6/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        if (titleTextField.text?.isEmpty)! || (contentTextField.text?.isEmpty)! {
            showAlertController(with: "Field is empty", message: "Please check your input field.")
        }
        
        // check input field
        guard let title = titleTextField.text else { return }
        guard let content = contentTextField.text else { return }
        let id = RandomStringGenerator.getRandomString(length: 25)
        
        Repository.shared.requestSaveNote(withId: id, title: title, content: content) { success in
            if success {
                dismiss(animated: true, completion: nil)
            } else {
                showAlertController(with: "Error", message: "Could not save data.")
            }
        }
    }
    
    
    // MARK: - Private API's
    
    private func setupViews() {
        // setup navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Resources.Color().applicationBaseColor
    }    
}
