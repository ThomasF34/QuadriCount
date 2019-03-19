//
//  Person.swift
//  PersonProjet
//
//  Created by Thomas Falcone on 12/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import Foundation
import UIKit

public class Person {
    public var lastname: String
    public var firstname: String
    public var birthdate: Date?
    
    public var fullname : String {
        return self.firstname + " " + self.lastname
    }
    
    public var age : Int? {
        guard let birth = self.birthdate else {
            return nil
        }
        return Calendar.current.dateComponents([.year], from: birth, to: Date()).year!
    }
    
    public init(fn : String, ln: String){
        self.lastname = ln
        self.firstname = fn
    }
    
    public convenience init(fn : String, ln: String, birthdate: Date){
        self.init(fn: fn, ln: ln)
        self.birthdate = birthdate
    }
    
    public func birthdate(birthdate : Date) {
        self.birthdate = birthdate
    }
}

extension Person : Equatable {
    public static func ==(p1: Person, p2: Person) -> Bool {
        return p1.lastname == p2.lastname && p1.firstname == p2.firstname && p1.birthdate == p2.birthdate
    }
    
    public static func !=(p1: Person, p2: Person) -> Bool {
        return !(p1 == p2)
    }
}
