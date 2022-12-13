//
//  ViewController.swift
//  MultipleObjectsSameAction
//
//  Created by Raffaele Cristallo on 30/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swOptionA : UISwitch!
    
    @IBOutlet weak var swOptionB : UISwitch!
    
    @IBAction func swOptionsValueChanged(_ sender: UISwitch) {
        
        switch sender.tag {
        case 1:
            if swOptionA.isOn {
                swOptionB.isOn = false
            }
        case 2:
            if swOptionB.isOn {
                swOptionA.isOn = false
            }
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

