//
//  DocumentsViewController.swift
//  Documents
//
//  Created by Anand Kulkarni on 8/28/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var documentsTableView: UITableView!
    
    var documents = [Document]()
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Documents"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        dateFormatter.dateFormat = "MMMM d, yyyy HH:MM"
        // Do any additional setup after loading the view.
    }
//
//    var filePath: String {
//        let manager = FileManager.default
//        let documentsURL = manager.urls(for: documentDirectory, in: userDomainMask)[0]
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let cell = cell as? DocumentsTableViewCell {
            
        
        let document = documents[indexPath.row]
            
            cell.titleLabel.text = document.title
            cell.sizeLabel.text = String(document.size)
            cell.dateLabel.text = dateFormatter.string(from: document.date)
            
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedDocument" {
            if let destination = segue.destination as? DocumentsViewController,
                let row = documentsTableView.indexPathForSelectedRow?.row {
                destination.documents = [documents[row]]
            }
        }
    }
}
