//
//  Student.swift
//  Midterm-Review
//
//  Created by Raffaele Cristallo on 19/10/22.
//

import Foundation

class Student {

    var id : Int = 0   // Unique - Auto generated
    
    var name : String = ""
    var email : String = ""
    
    // constructor
    init( id : Int = 0, name : String, email : String ) {
        self.id = id
        self.name = name
        self.email = email
    }
    
}
