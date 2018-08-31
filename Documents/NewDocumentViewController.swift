//
//  NewDocumentViewController.swift
//  Documents
//
//  Created by Anand Kulkarni on 8/30/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var documentsTextView: UITextView!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let document = document {
            documentsTextView.text = document.content
            nameTextField.text = document.title
            
            title = document.title
        } else {
            title = ""
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        guard nameTextField.text != nil else{
            return
        }
    }
}
