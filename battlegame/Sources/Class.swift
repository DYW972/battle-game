//
//  Class.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//
import Foundation

// Player Class
class Player {
    
    // Properties
    
    var name: String
    var fighters = [Character]()
    var score = 0
    var isWinner = false
    
    // Initializer
    init(name:String){
        self.name = name
    }
    
    // Methods
    
    // Player rename
    func renamePlayer(with newName: String){
        self.name = newName
    }
    
    // Player choose fighters
    func playerChooseFighters(fighters: Character){
        self.fighters.append(fighters)
    }
}

// Maybe I will extend character class with different children

// Characters class
class Character {
    
    // Properties
    var name: String
    var health = 200
    var attack = 30
    var weapon = "Basic Sword" {
        willSet {
            print("\(name) has a chance to gain a new weapon !")
        }
        
        didSet {
            print("\(name) got \(weapon) as new weapon !")
        }
    }
    var isDead = false
    
    //Initializer
    init(name:String){
        self.name = name
    }
    
    // Methods
    
    // Rename character
    func renameCharacter(with newName: String){
        self.name = newName
    }
    
    // Character attacks opponent
    func attackOpponent(target: Character){
        if health > 0 {
            let damages = attack
            print("\(name) inflicts \(target.name) \(damages) damage points")
            target.health -= damages
            if target.health > 0 {
                print("\(target.name) still have \(target.health) life points.")
            } else {
                target.health = 0
                print("\(name) defeated \(target.name)")
                target.isDead = true
            }
            
        } else {
            print("\(name) has no life point and cannot attack !")
        }
    }
    
    // Character heals teammate
    func healTeammate(target: Character){
        let healingPotion = 30 // Will be better to add healing potion in the lotery chest with different value 
        print("\(name) gives \(target.name) healing potion.")
        target.health += healingPotion
        print("\(target.name) got \(healingPotion) health points.")
    }
    
    // Describe the character after attack
    func describe(){
        print("\(name) have \(health) life points, \(attack) attack point(s) and \(weapon) as weapon")
    }
    
}
