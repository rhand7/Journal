//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by handje on 6/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews() 
    }
    
    // MARK: Properties
    
    var entry: Entry?
    
    // MARK: IB Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: IB Actions 
    @IBAction func saveButtonTapped(_ sender: Any) {
    guard let title = self.titleTextField.text, !title.isEmpty,
        let bodyText = self.bodyTextView.text, !bodyText.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyText)
        } else {
            EntryController.shared.addNewEntryWith(title: title, bodyText: bodyText)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - updateViews
    
    func updateViews() {
        if let entry = entry {
            titleTextField.text = entry.title
            bodyTextView.text = entry.bodyText
        }
    }
}
