//
//  StudentProvider.swift
//  Midterm-Review
//
//  Created by Raffaele Cristallo on 19/10/22.
//

import Foundation

class StudentProvider {
    
    static var lastUsedId : Int = 0  // ID Generator
    
    static func generateNextId() -> Int {
        StudentProvider.lastUsedId += 1
        return StudentProvider.lastUsedId
    }
    
    // SELECT * FROM student
    static var all : [Student] = []
    
    // (INSERT and/or UPDATE)
    static func save( student : Student ) {
        
        if student.id == 0 { // insert
            
            student.id = StudentProvider.generateNextId()
            StudentProvider.all.append(student)
            
        } else { // update
            
            for index in (0..<StudentProvider.all.count) {

                if StudentProvider.all[index].id == student.id {
                    StudentProvider.all[index] = student
                    break
                }

            }
            
        }
        
    }
    
    // DELETE
    static func delete( student : Student ) {
        
        for index in (0..<StudentProvider.all.count) {
            
            if StudentProvider.all[index].id == student.id {
                StudentProvider.all.remove(at: index)
                break
            }
                
        }
        
    }
    
    
    
    static func generateMockData() {
        
        for i in (0...9) {
            let student = Student(name: "STUDENT #\(i+1)", email: "student\(i+1)@gmail.com")
            StudentProvider.save(student: student)
        }
        
    }
    
    
}


class StudentProviderTest {
    
    static func execute() {
        
        // insert
        let student1 = Student(name: "Daniel", email: "daniel@gmail")
        let student2 = Student(name: "Sarah", email: "sarah@gmail")

        StudentProvider.save(student: student1)
        StudentProvider.save(student: student2)
        
        // Update
        student1.email = "anyemail@gmail.com"
        StudentProvider.save(student: student1)
        
        // Delete
        StudentProvider.delete(student: student1)
        
        
        for student in StudentProvider.all {
            print("\(student.id), NAME: \(student.name), EMAIL: \(student.email)")
        }

        
    }
    
    
}
