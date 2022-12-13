//
//  ViewController.swift
//  Midterm-Review
//
//  Created by Raffaele Cristallo on 19/10/22.
//

import UIKit

class ViewController: UIViewController {

    /*  Segue:
                                          Chance of validation Sending data
     Object -> View | Auto PerformSegue | ShouldPerformSegue | PrepareForSegue
     
     View   -> View | Programmatically call PerformSegue     | PrepareForSegue
     
     */
    
    @IBOutlet var txtEmail : UITextField!
    @IBOutlet var txtPassword : UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //StudentProviderTest.execute()
        
        
    }

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // validation
        
        if identifier == Segue.toStudentListViewController {
            
            if let email = txtEmail.text, let password = txtPassword.text, !email.isEmpty, !password.isEmpty {
                return true
            }
            
        }
        
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toStudentListViewController {
            
            let studentListViewController = segue.destination as! StudentListViewController
            
            studentListViewController.loggedUserEmailAddress = txtEmail.text
            
        }
        
    }
    

}

