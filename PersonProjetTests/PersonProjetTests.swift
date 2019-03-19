//
//  PersonProjetTests.swift
//  PersonProjetTests
//
//  Created by Thomas Falcone on 12/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import XCTest
@testable import PersonProjet

class PersonProjetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInit(){
        let p = Person(fn: "thomas", ln: "falcone")
        XCTAssertEqual(p.firstname,"thomas")
        XCTAssertEqual(p.lastname, "falcone")
    }
    
    func testFullname(){
        let p = Person(fn: "thomas", ln: "falcone")
        XCTAssertEqual(p.fullname, "thomas falcone")
    }
    
    func testBirthdate(){
        let p = Person(fn: "thomas", ln: "falcone")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = formatter.date(from: "1996/03/12 07:02")!
        p.birthdate(birthdate: date)
        XCTAssertEqual(p.birthdate, date)
    }
    
    func testNilAge(){
        let p = Person(fn: "thomas", ln: "falcone")
        XCTAssertNil(p.age)
    }
    
    func testAge(){
        let p = Person(fn: "thomas", ln: "falcone")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = formatter.date(from: "1996/03/12 07:02")!
        p.birthdate(birthdate: date)
        XCTAssertEqual(p.age, 23)
    }
    
    func testEqualsNotEquals(){
        let p1 = Person(fn: "thomas", ln: "falcone")
        let p2 = Person(fn: "thomas", ln: "falcone")
        let p3 = Person(fn: "thomas", ln: "thomas")
        XCTAssertEqual(p1, p2)
        XCTAssertNotEqual(p1, p3)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = formatter.date(from: "1996/03/12 07:02")!
        p1.birthdate(birthdate: date)
        p2.birthdate(birthdate: date.addingTimeInterval(2000))
        XCTAssertNotEqual(p1, p2)
    }
}
