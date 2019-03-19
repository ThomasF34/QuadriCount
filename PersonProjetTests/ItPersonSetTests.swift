//
//  ItPersonSet.swift
//  PersonProjetTests
//
//  Created by Thomas Falcone on 15/03/2019.
//  Copyright © 2019 Thomas Falcone. All rights reserved.
//

import XCTest

class ItPersonSetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrent() {
        let p = Person(fn: "thomas", ln: "falcone")
        let p2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [p,p2])
        let it = set.makeIterator()
        XCTAssertEqual(it.current, p)
    }
    
    func testNext(){
        let p = Person(fn: "thomas", ln: "falcone")
        let p2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [p,p2])
        let it = set.makeIterator()
        XCTAssertEqual(it.next(), p)
        XCTAssertEqual(it.next(), p2)
    }
    
    func testEnd(){
        let p = Person(fn: "thomas", ln: "falcone")
        let p2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [p,p2])
        let it = set.makeIterator()
        it.next()
        it.next()
        XCTAssertTrue(it.end)
    }
    
    func testReset(){
        let p = Person(fn: "thomas", ln: "falcone")
        let p2 = Person(fn: "lucas", ln: "goncalves")
        let set = PersonSet(with : [p,p2])
        let it = set.makeIterator()
        it.next()
        it.next()
        it.reset()
        XCTAssertEqual(it.current, p)
    }
    
    

}
