//
//  PersonSetTests.swift
//  PersonProjetTests
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import XCTest

class PersonSetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit(){
        let set = PersonSet()
        XCTAssertTrue(set.isEmpty)
        let set2 = PersonSet(with: [Person(fn: "Thomas", ln: "Falcone")])
        XCTAssertFalse(set2.isEmpty)
    }

    func testCount(){
        let set = PersonSet()
        XCTAssertEqual(set.isEmpty, set.count == 0)
    }
    
    func testAdd(){
        let set = PersonSet()
        let old_count = set.count
        set.add(person : Person(fn: "thomas", ln: "falcone"))
        XCTAssertEqual(old_count + 1, set.count)
    }
    
    func testRemove(){
        let person = Person(fn: "thomas", ln: "falcone")
        let set = PersonSet(with: [person])
        let old_count = set.count
        set.remove(person: person)
        XCTAssertEqual(old_count - 1, set.count)
    }
    
    // MARK: - Contains
    func testContains(){
        let person = Person(fn: "thoams", ln: "falcone")
        let set = PersonSet(with : [person])
        XCTAssertTrue(set.contains(person : person))
    }
    
    func testContainsFirstname(){
        let person = Person(fn: "thomas", ln: "falcone")
        let set = PersonSet(with : [person])
        XCTAssertTrue(set.contains(firstname : "thomas"))
        XCTAssertFalse(set.contains(firstname : "bernard"))

    }
    
    func testContainsLastname(){
        let person = Person(fn: "thomas", ln: "falcone")
        let set = PersonSet(with : [person])
        XCTAssertTrue(set.contains(lastname : "falcone"))
        XCTAssertFalse(set.contains(lastname : "dupont"))
    }
    
    // MARK: - Look
    func testLook(){
        let person = Person(fn: "thomas", ln: "falcone")
        let person2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [person, person2])
        XCTAssertEqual(set.look(person: person), person)
    }
    
    func testLookFirstname(){
        let person = Person(fn: "thomas", ln: "falcone")
        let person2 = Person(fn: "lucas", ln: "goncalves")
        let person3 = Person(fn: "thomas", ln: "bernard")
        let set = PersonSet(with : [person, person2])
        XCTAssertEqual(set.look(firstname: "thomas"), [person])
        set.add(person: person3)
        XCTAssertEqual(set.look(firstname: "thomas"), [person,person3])
    }
    
    func testLookLastname(){
        let person = Person(fn: "thomas", ln: "falcone")
        let person2 = Person(fn: "lucas", ln: "goncalves")
        let person3 = Person(fn: "bernard", ln: "falcone")
        let set = PersonSet(with : [person, person2])
        XCTAssertEqual(set.look(lastname: "falcone"), [person])
        set.add(person: person3)
        XCTAssertEqual(set.look(lastname: "falcone"), [person,person3])
    }
    
    func testLookFnAndLn(){
        let person = Person(fn: "thomas", ln: "falcone")
        let person2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [person, person2])
        XCTAssertEqual(set.look(firstname: "thomas", lastname: "falcone"), [person])
    }
    
    func testLookAllInfo(){
        //TODO
        XCTAssertTrue(true)
    }
    
    
}
