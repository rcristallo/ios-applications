//
//  ViewController.swift
//  BMIApp_v2
//
//  Created by Raffaele Cristallo on 28/09/22.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var txtHeightInCm: UITextField!
    
    @IBOutlet weak var txtWeightInKg: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
       
        guard let heightInCm = Double(txtHeightInCm.text!), let weightInKg = Double(txtWeightInKg.text!),(30...300).contains(weightInKg),(80...250).contains(heightInCm) else {
            
            lblResult.text = "Invalid height and weight"
            lblResult.isHidden = false
            return
        }

        let bmi: Double = calculateBMI(heightInCm: heightInCm, weightInKg: weightInKg)

        let bmiClassification = bmiClassification(bmi: bmi)
        
        lblResult.text = "BMI classification = \(bmiClassification.classification)"
        lblResult.backgroundColor = bmiClassification.color
        lblResult.isHidden = false

        
        /*
        if let heightInCm = Double(txtHeightInCm.text!), let weightInKg = Double(txtWeightInKg.text!),(30...300).contains(weightInKg),(80...250).contains(heightInCm) {
            
            let bmi: Double = calculateBMI(heightInCm: heightInCm, weightInKg: weightInKg)
   
            let bmiClassification = bmiClassification(bmi: bmi)
            
            lblResult.text = "BMI classification = \(bmiClassification.classification)"
            lblResult.backgroundColor = bmiClassification.color
            lblResult.isHidden = false
        }else{
            
            lblResult.text = "Invalid height and weight"
            lblResult.isHidden = false
        }
        */
    }
    
    @IBAction func txtHeightInCmEditingChanged(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    @IBAction func txtWeightInKgEditingChanged(_ sender: Any) {
        lblResult.isHidden = true
        
    }
    
    func calculateBMI ( heightInCm : Double, weightInKg : Double ) -> Double {
        let heightInM = heightInCm/100
        let BMI = weightInKg/pow(heightInM,2)
        return round(BMI*10)/10
    }
    
    func bmiClassification(bmi:Double) -> (classification : String, color : UIColor) {
        
        if (0..<18.5).contains(bmi) {
            return ("Underweight", UIColor.blue)
        }else if (18.5...24.9).contains(bmi){
            return ("Normal", .green)
        }else if (25...29.9).contains(bmi){
            return ("Overweight", .yellow)
        }else if (30...100).contains(bmi){
            return ("Obesity", .orange)
        }else{
            return ("BMI is out of range!", .white)
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResult.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }


}

