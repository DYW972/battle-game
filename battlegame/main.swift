//
//  main.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation
// MARK: PROPERTIES

//Player one
var playerOne = Player(name:"PlayerOne")
//Player two
var playerTwo = Player(name:"PlayerTwo")


// MARK: FUNCTIONS

// 1. Game menu start
func presentMenu(){
    print("\n============================"
        + "\n== Welcome in Battle Game =="
        + "\n============================")
    switch true {
    case playerOne.fighters.count == 0  && playerTwo.fighters.count == 0 :
        print("\n"
            + "\nChoose your side"
            + "\n1. Player One"
            + "\n2. Player Two"
            + "\n")
        
        // Get Users choice
        if let choice = readLine(){
            switch choice {
            case "1":
                //Create player one object
                //givePlayerOneName()
                addNameToPlayer(rank: choice)
            case "2":
                //Create player two object
                addNameToPlayer(rank: choice)
            default:
                //Please select option 1 or 2
                print("\n"
                    + "\nSorry I don't understand your choice."
                    + "\n")
                //Restart the programme
                presentMenu()
            }
        }
        
    case playerTwo.fighters.count == 0:
        print("Player One ready to fight")
        print("\n"
            + "\nChoose your side"
            + "\n2. Player Two"
            + "\n")
        // Get Users choice
        if let choice = readLine(){
            if choice == "2"{
                //Create player one object
                addNameToPlayer(rank: choice)
            } else {
                //Please select option 2
                print("\n"
                    + "\nI'm sorry but you can only choose option : 2."
                    + "\n")
                //Restart the programme
                presentMenu()
            }
        }
    case playerOne.fighters.count == 0:
        print("Player Two ready to fight")
        print("\n"
            + "\nChoose your side"
            + "\n1. Player One"
            + "\n")
        // Get Users choice
        if let choice = readLine(){
            if choice == "1"{
                //Create player one object
                addNameToPlayer(rank: choice)
            } else {
                //Please select option 1
                print("\n"
                    + "\nI'm sorry but you can only choose option : 1."
                    + "\n")
                //Restart the programme
                presentMenu()
            }
        }
    case playerOne.fighters.count == 3  && playerTwo.fighters.count == 3 :
        print("""
                Well, both of you are ready to fight !

                Player One Team :

                """)
        for fighter in playerOne.fighters{
            print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        
        print("\n"
            + "\nPlayer Two Team :"
            + "\n")
        for fighter in playerTwo.fighters{
            print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
    default :
        print("Choose your side.")
    }
}

// 2. Let player add his name
func addNameToPlayer(rank: String){
    print("\n"
        + "\nWhat's your name ?"
        + "\n")
    if let name = readLine(){
        let player = rank == "1" ? playerOne : playerTwo
        player.name = name
        print("\n"
            + "\nWelcome \(player.name)"
            + "\n")
        chooseFighters(player: player)
    }
}

// Give player's fighters a unique name function
func wichFighterToRename(player: Player){
    print("\n"
        + "\nWich fighter you want to rename?"
        + "\n")
    
    for (index, fighter) in player.fighters.enumerated(){
        print("\(index + 1). \(fighter.name)"
            + "\n")
    }
    print("Finish ? yes/no"
        + "\n")
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print(player.fighters[0].name)
            
        case "2":
            print(player.fighters[1].name)
            
        case "3":
            print(player.fighters[2].name)
            
        case "yes":
            print("\n"
                + "\nRenaming terminated."
                + "\n")
            
        default :
            print("I did not understand your choice.")
            wichFighterToRename(player: player)
        }
        
        if choice == "yes" {
            print("\n"
                + "\nWell done. Now take a last look at your team :"
                + "\n")
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
        } else {
            wichFighterToRename(player: player)
        }
    }
}

// Ask player for renaming fighters.
func askForRenaming(player: Player){
    print("\n"
        + "\nDo you want to rename your figthers? yes/no"
        + "\n")
    
    if let choice = readLine(){
        switch choice.lowercased() {
        case "yes":
            print("\n"
                + "\nOk. You want to rename your figthers."
                + "\n")
            wichFighterToRename(player: player)
        case "no":
            print("\n"
                + "\nWell done. Now take a last look at your team :"
                + "\n")
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
        default:
            print("Sorry but I did not understand."
                + "\n")
            askForRenaming(player: player)
        }
    }
}

//Player select fighters menu
func chooseFighters(player: Player){
    while player.fighters.count < 3 {
        print("\n"
            + "\nChoose 3 fighters: "
            + "\n1. Thanos"
            + "\n2. Odin"
            + "\n3. Zeus"
            + "\n4. Athena"
            + "\n5. Hera"
            + "\n6. Valkyrie"
            + "\n7. Groot"
            + "\n8. StarLord"
            + "\n9. Marvel"
            + "\n")
        
        if let choice = readLine() {
            //Select a figther to add in the team
            switch choice {
            case "1":
                let fighter = Character(name: "Thanos")
                player.fighters.append(fighter)
            case "2":
                let fighter = Character(name: "Odin")
                player.fighters.append(fighter)
            case "3":
                let fighter = Character(name: "Zeus")
                player.fighters.append(fighter)
            case "4":
                let fighter = Character(name: "Athena")
                player.fighters.append(fighter)
            case "5":
                let fighter = Character(name: "Hera")
                player.fighters.append(fighter)
            case "6":
                let fighter = Character(name: "Valkyrie")
                player.fighters.append(fighter)
            case "7":
                let fighter = Character(name: "Groot")
                player.fighters.append(fighter)
            case "8":
                let fighter = Character(name: "StarLord")
                player.fighters.append(fighter)
            case "9":
                let fighter = Character(name: "Marvel")
                player.fighters.append(fighter)
            default:
                //The player did not select an option between 1 & 9
                print("\n"
                    + "\nSorry but I did not understand."
                    + "\n Choose a fighters between the nine proposed."
                    + "\n")
                chooseFighters(player: player)
            }
            //Display fighters selection informations
            print("\n"
                + "\nThere is \(player.fighters.count) figthers in your team:")
            for fighter in player.fighters{
                print("\n\(fighter.name)")
            }
        }
    }
    //Team is complete, now allow the player to rename fighters.
    print("\n"
        + "\nGood, you have your 3 figthers in your team."
        + "\nNow you can give them a unique name if you want."
        + "\n")
    
    askForRenaming(player: player)
}


//Add a super weapon lotery possibility function
func weaponChest(attacker: Character){
    let weapons = ["Magic Fire Sword", "Magic Thunder Spear", "Mjöllnir", "Gungnir", "Caducée", "Trisula", "Vajra", "Balizarde", "Andúril", "Alastor", "Aubéclat", "Bakuzan", "Dard", "Dragon Slayer", "Dimension Sword", "Excalibur", "Glace", "Masamuné", "Master Sword", "Murasame", "Orcrist", "Sakabato", "Samehada", "Wadô Ichimonji", "Zanpakutō"]
    let newAttackPoint = Int.random(in:0..<100)
    attacker.weapon = weapons.randomElement()!
    attacker.attack = newAttackPoint
}
