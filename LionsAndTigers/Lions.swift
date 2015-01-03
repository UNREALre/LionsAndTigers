//
//  Lions.swift
//  LionsAndTigers
//
//  Created by Александр Подрабинович on 03/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import Foundation
import UIKit

class Lions {
    var name = ""
    var age = 0
    var image = UIImage(named: "")
    var isAlphaMale = false
    var subspecies = ""
    
    func randomFact() -> String {
        var randomFact = ""
        if self.isAlphaMale {
            randomFact = "This is a very dangerous MALE!"
        }
        else {
            randomFact = "This is a very cute lioness!"
        }
        
        return randomFact
    }
    
    func roar() {
        println("ROAR!!!")
    }
}