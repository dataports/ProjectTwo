//
//  EyelinerKitTest.swift
//  ProjectTwo
//
//  Created by Sophia Amin on 4/17/18.
//  Copyright © 2018 Sophia Amin. All rights reserved.
//

import Foundation


class EyelinerKit{
    var brandInKit:String
    var priceOfOneEyeliner:Int
    var priceOfOneKit:Int
    var isThereBlueEL:Bool
    
    init() {
        self.brandInKit    = ""
        self.priceOfOneEyeliner   = 0
        self.priceOfOneKit = 0
        self.isThereBlueEL = false
    }
    
    init?(myBrand: String, myPriceEyeliner:Int, myPriceKit:Int, myIsBlueEL:Bool){
        if myPriceKit  < 0 {
            return nil
        }
        self.brandInKit    = myBrand
        self.priceOfOneEyeliner  = myPriceEyeliner
        self.priceOfOneKit = myPriceKit
        self.isThereBlueEL = myIsBlueEL
    }
    
    func newPriceOfKit(inputPrice:Int) -> Int{
        let newKitPrice = priceOfOneKit + inputPrice
        return newKitPrice
    }
    
    func newPriceOfEyeliner(inputPrice:Int) -> Int{
        let newELPrice = priceOfOneEyeliner + inputPrice
        return newELPrice
    }
    
    func isBlueEyeliner(inputBlueEyeliner:Bool) ->Bool{
        return inputBlueEyeliner
    }
    
    func newProductName(inputName: String) ->String{
        let newProductName = brandInKit + " " + "Electric"
        return newProductName
    }
    
    
}
