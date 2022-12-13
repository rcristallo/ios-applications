//
//  ViewController.swift
//  DogsAgeV2
//
//  Created by Raffaele Cristallo on 21/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    @IBAction func txtAgeEditingChanged(_ sender: Any) {
        
        lblResult.isHidden = true
    }
    
    
    @IBAction func btnCheckItOutTouchUpInside(_ sender: Any) {
        
        // null / nil safety
//        if let age = Int(txtAge.text!), age >= 1 && age <= 20 {
        if let age = Int(txtAge.text!), (1...20).contains(age) {

            let ageInYears = convertDogAgeIntoHumanAge(ageInYears: age)
            lblResult.text = "If your \(age) years old dog were a human, he/she would have \(ageInYears) years old"
            
        } else {
            
            lblResult.text = "Please, enter a valid age between 1 and 20 years old!"
            
        }
        lblResult.isHidden = false
        
    }
    
    /// Convert the givin dog age into human age.
    func convertDogAgeIntoHumanAge( ageInYears : Int ) -> Int {
        return ageInYears * 7
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.isHidden = true
    }


}

