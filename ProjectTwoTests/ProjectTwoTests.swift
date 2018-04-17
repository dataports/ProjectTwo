//
//  ProjectTwoTests.swift
//  ProjectTwoTests
//
//  Created by Sophia Amin on 4/16/18.
//  Copyright © 2018 Sophia Amin. All rights reserved.
//

import XCTest
@testable import ProjectTwo

class ProjectTwoTests: XCTestCase {
    
    func testConstructorNil(){
        let myNilInstance = EyelinerKit(myBrand: "KVD", myPriceEyeliner: 20, myPriceKit: -1, myIsBlueEL:true)
        XCTAssertNil(myNilInstance)
    }
    
    //Must create the instance, then use intance to call method
    func testNewKitPrice(){
        let kitInstance = EyelinerKit(myBrand: "KVD", myPriceEyeliner: 10, myPriceKit: 90, myIsBlueEL: true)
        let checkNewPrice = kitInstance?.newPriceOfKit(inputPrice: 5)
        XCTAssertEqual(15, checkNewPrice)
    }
    //Must create the instance, then use intance to call method
    func testNewEyelinerPrice(){
        let kitInstance = EyelinerKit(myBrand: "KVD", myPriceEyeliner: 5, myPriceKit: 90, myIsBlueEL: true)
        let checkNewPrice = kitInstance?.newPriceOfEyeliner(inputPrice: 20)
        XCTAssertEqual(25, checkNewPrice)
    }
    
    //Must create the instance, then use intance to call method
    func testBlueELFALSE(){
        let kitInstance = EyelinerKit()
        let checkBlueEL = kitInstance.isBlueEyeliner(inputBlueEyeliner: false)
        XCTAssertEqual(true, checkBlueEL)
    }
    
    //Must create the instance, then use intance to call method
    func testBlueELTRUE(){
        let kitInstance = EyelinerKit()
        let checkBlueEL = kitInstance.isBlueEyeliner(inputBlueEyeliner: true)
        XCTAssertEqual(true, checkBlueEL)
    }
    
    func testNewName(){
        let kitInstance = EyelinerKit(myBrand: "KVD", myPriceEyeliner: 10, myPriceKit: 90, myIsBlueEL: true)
        let newNameOfKit = kitInstance?.newProductName(inputName: "KVD")
        XCTAssertEqual("KVD Electric", newNameOfKit)
    }
    
}
