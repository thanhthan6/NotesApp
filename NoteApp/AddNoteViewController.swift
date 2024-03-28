//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Macbook on 13/11/2023.
//

import UIKit

class AddNoteViewController: UIViewController {

    var note: Note?
    var update = false
    
    @IBOutlet weak var titleTextField: UITextView!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    @IBAction func saveClick(_ sender: Any) {
        if update == true {
            APIFunctions.functions.updateNote(date: "Placeholder", title: titleTextField.text!, note: bodyTextView.text, id: note!._id)
        } else {
            APIFunctions.functions.AddNote(date: "Placeholder", title: titleTextField.text!, note: bodyTextView.text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if update == true {
            titleTextField.text = note!.title
            bodyTextView.text = note!.note
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
