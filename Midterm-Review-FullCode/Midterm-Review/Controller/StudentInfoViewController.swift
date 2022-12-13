//
//  StudentInfoViewController.swift
//  Midterm-Review
//
//  Created by Raffaele Cristallo on 19/10/22.
//

import UIKit

class StudentInfoViewController: UIViewController {

    var selectedStudent : Student?   // can be nil
    
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtEmail : UITextField!
    
    @IBOutlet var btnDelete : UIButton!
    
    @IBAction func btnSaveTapped( _ sender : Any ) {
        
        // Back here!! Need validation
        
        if selectedStudent == nil { // insert
            
            selectedStudent = Student(name: txtName.text!, email: txtEmail.text!)
            
        } else { // update
            
            selectedStudent!.name = txtName.text!
            selectedStudent!.email = txtEmail.text!
            
        }

        StudentProvider.save(student: selectedStudent!)
        navigationController?.popViewController(animated: true)

    }

    @IBAction func btnDeleteTouchUpInside( _ sender : Any ) {
        
        StudentProvider.delete(student: selectedStudent!)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    func initialize(){
        
        // Two modes: Insert and Edit (update and delete)
        if selectedStudent == nil {  // inser mode
            
            title = "New Student"
            btnDelete.isHidden = true
            
        } else { // edit mode
            
            title = "Editing Student"
            btnDelete.isHidden = false
            
            txtName.text = selectedStudent!.name
            txtEmail.text = selectedStudent!.email
            
        }
        
        
    }
    
}
