//
//  File.swift
//  Notes
//
//  Created by Arifin Firdaus on 1/7/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlertController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}



