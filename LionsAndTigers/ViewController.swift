//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Александр Подрабинович on 02/01/15.
//  Copyright (c) 2015 Alex Podrabinovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var myLions:[Lions] = []
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "John"
        myTiger.breed = "Super"
        myTiger.age = myTiger.realTigerAge(3)
        myTiger.image = UIImage(named: "1.jpg")
        
        var secondTiger = Tiger()
        secondTiger.name = "Mike"
        secondTiger.breed = "Very cool"
        secondTiger.age = secondTiger.realTigerAge(7)
        secondTiger.image = UIImage(named: "2.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Bor"
        thirdTiger.breed = "The Greatest"
        thirdTiger.age = thirdTiger.realTigerAge(11)
        thirdTiger.image = UIImage(named: "3.jpg")
        
        myTigers += [myTiger, secondTiger, thirdTiger]
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        breedLabel.text = myTiger.breed
        ageLabel.text = "\(myTiger.age)"
        factLabel.text = myTiger.randomFactAboutTiger()
        
        /*
        myTiger.chuffTiger(5, isLoud: true)
        secondTiger.chuffTiger(3, isLoud: false)
        */
        
        var firstLion = Lions()
        firstLion.name = "Bob"
        firstLion.age = 3
        firstLion.subspecies = "African"
        firstLion.image = UIImage(named: "4.jpg")
        firstLion.isAlphaMale = true
        
        var secondLion = Lions()
        secondLion.name = "Mark"
        secondLion.age = 5
        secondLion.subspecies =  "USA"
        secondLion.image = UIImage(named: "5.jpg")
        secondLion.isAlphaMale = false
        
        myLions += [firstLion, secondLion]
        
        secondLion.roar()
        
        var lionCub = LionCub()
        lionCub.roar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateAnimal() {
        switch self.currentAnimal {
        case ("Tiger", _):
            let randomLion = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomLion)
        default:
            let randomTiger = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomTiger)
        }
        
    }
    
    func updateView() {
        if self.currentAnimal.species == "Tiger" {
            let tiger = self.myTigers[self.currentAnimal.index]
            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: {
                    self.myImageView.image = tiger.image
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                    self.breedLabel.text = tiger.breed
                    self.factLabel.text = tiger.randomFactAboutTiger()
                }, completion: {
                    (finished: Bool) -> () in
            })
        }
        else if self.currentAnimal.species == "Lion" {
            let lion = self.myLions[self.currentAnimal.index]
            UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: {
                    self.myImageView.image = lion.image
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                    self.breedLabel.text = lion.subspecies
                    self.factLabel.text = lion.randomFact()
                }, completion: {
                    (finished: Bool) -> () in
            })
        }
    }

    @IBAction func nextToolbarButtonPressed(sender: UIBarButtonItem) {
//        updateTiger()
        self.updateAnimal()
        self.updateView()
    }
    
    func updateTiger(){
        var randomIndex:Int
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while (randomIndex == currentIndex)
        currentIndex = randomIndex
        
        let currentTiger = myTigers[currentIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.myImageView.image = currentTiger.image
                self.ageLabel.text = "\(currentTiger.age)"
                self.nameLabel.text = currentTiger.name
                self.breedLabel.text = currentTiger.breed
                self.factLabel.text = currentTiger.randomFactAboutTiger()
            }, completion: {
                (finished: Bool) -> () in
        })
    }

}

