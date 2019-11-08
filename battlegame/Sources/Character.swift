//
//  Class.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//
import Foundation

class Character {
    // MARK: Properties
    var name: String
    var health = 200
    var healingPoints = 0
    var isDead = false
    var weapon: Weapon {
        willSet {
            print("\(name) has a chance to gain a new weapon !")
        }
        
        didSet {
            print("""
                
                \(name) is lucky ! A magic chest appears and give \(name) a chance to get a magic object !
                What's inside ... ?!
                Oh! \(name) got \(weapon) as new weapon !
                
                """)
        }
    }
    var potion = "0"{
        didSet {
            if potion == "0" {
                print("\(name) have 0 potion !")
            } else {
                print("""
                    
                    \(name) is lucky ! A magic chest appears and give \(name) a chance to get a magic object !
                    What's inside ... ?!
                    Oh! \(name) got \(potion) has new magic potion !
                    
                    """)
            }
        }
    }
    
    //Initializer
    init(name:String){
        self.name = name
        let basicWeapon = Weapon.init(name: "Basic Sword", damages: 30)
        self.weapon = basicWeapon
    }
    
    // MARK: Methods
    
    // Rename character
    func renameCharacter(with newName: String){
        self.name = newName
    }
    
    // Character attacks opponent
    func attackOpponent(target: Character){
        if isDead == true {
            print("\(name) has no life point and cannot attack !")
        } else {
            if health > 0 {
                print("\(name) inflicts \(target.name) \(weapon.damages) damage points")
                target.health -= weapon.damages
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
    }
    
    // Character heals teammate
    func healTeammate(target: Character) -> Bool {
        var status: Bool
        if target.isDead == true {
            print("Sorry but \(target.name) is already dead and can't be heal.")
            status = false
        } else if target.health >= 200 {
            print("Sorry but \(target.name) have max health and can't be heal.")
            status = false
        } else if healingPoints == 0 {
            if target.name == name {
                print("""
                    
                    Sorry but \(name) don't have a magic potion
                    
                    """)
            }else{
                print("""
                    
                    Sorry but \(name) don't have a magic potion for healing \(target.name)!
                    
                    """)
            }
            status = false 
        }else {
            let healingPointsLimit = 200 - target.health
            if healingPoints > healingPointsLimit {
                healingPoints = healingPointsLimit
            }
            target.health += healingPoints
            if target.name == name {
                print("""
                    
                    \(name) took \(potion) and got \(healingPoints) health points.
                    \(name) have now \(health) health points.
                    
                    """)
            }else{
                print("""
                    
                    \(name) gives \(target.name) \(healingPoints) health points.
                    \(target.name) have now : \(target.health) health points.
                    
                    """)
            }
            healingPoints = 0
            potion = "0"
            status = true
        }
        return status
    }
}
