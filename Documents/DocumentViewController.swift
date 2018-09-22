//
//  DocumentViewController.swift
//  Documents
//
//  Created by Anand Kulkarni on 9/21/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        if let document = document {
            let name = document.name
            nameTextField.text = name
            contentTextView.text = document.content
            title = name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDocuments(_ sender: Any) {
    guard let name = nameTextField.text else {
            return
        }
        
        let documentName = name.trimmingCharacters(in: .whitespaces)
        if (documentName == "") {
            return
        }
        
        let content = contentTextView.text
        
        if document == nil {
            document = Document(name: documentName, content: content)
        }
        
        if let document = document {
            do {
                let managedContext = document.managedObjectContext
                try managedContext?.save()
            } catch {
                print("The Document could not be saved")
            }
        } else {
            print("The document could not be created")
        }
        
        navigationController?.popViewController(animated: true)
    }
}

