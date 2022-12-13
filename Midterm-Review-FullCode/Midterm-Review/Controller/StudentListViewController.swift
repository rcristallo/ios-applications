//
//  StudentListViewController.swift
//  Midterm-Review
//
//  Created by Raffaele Cristallo on 19/10/22.
//

import UIKit

class StudentListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var loggedUserEmailAddress : String? // can be nil
    var selectedRow : Int?
    
    @IBOutlet var lblEmailAddress : UILabel!
    @IBOutlet var tableView : UITableView!

    @IBAction func btnRefreshTapped(_ sender : Any) {
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    func initialize() {
        
        lblEmailAddress.text = loggedUserEmailAddress
        
        //StudentProvider.generateMockData()
        
        for student in StudentProvider.all {
            print("ID: \(student.id), NAME: \(student.name), EMAIL: \(student.email)")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = StudentProvider.all[indexPath.row].name
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentProvider.all.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // get the selected student index
        // performSegue
        selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toStudentInfoViewControllerEditing, sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toStudentInfoViewControllerEditing {
            
            let studentInfoViewController = segue.destination as! StudentInfoViewController
            
            studentInfoViewController.selectedStudent = StudentProvider.all[selectedRow!]
            
        }
        
    }
    

}
