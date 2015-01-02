//
//  Tigers.swift
//  LionsAndTigers
//
//  Created by Александр Подрабинович on 02/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff() {
        println("Chuff! Chuff!")
    }
    
    func purr() {
        println("Purr, Purr :3")
    }
    
    func chuffTiger(chuffTimes: Int, isLoud: Bool) {
        if isLoud {
            for var tmpInd=1; tmpInd <= chuffTimes; tmpInd++ {
                chuff()
            }
        }
        else
        {
            for var tmpInd=1; tmpInd <= chuffTimes; tmpInd++ {
                purr()
            }
        }
    }
    
    func realTigerAge(tigerAge: Int) -> Int {
        let realAge = tigerAge*5;
        
        return realAge;
    }
    
    func randomFactAboutTiger() -> String {
        let randomFact = Int32(arc4random_uniform(UInt32(3)))
        var currentFact:String
        switch randomFact{
            case 0:
                currentFact = "Tiger is super"
            case 1:
                currentFact = "Tiger is big"
            case 2:
                currentFact = "Tiger is smart"
            default:
                currentFact = "Tiger is amazing"
        }
        return currentFact
    }
}