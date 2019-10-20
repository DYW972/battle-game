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
//Fighters
let fighters = ["Thanos","Odin","Zeus","Athena","Hera","Valkyrie","Groot","StarLord","Marvel"]


// MARK: FUNCTIONS

// 1. Game menu start
func presentMenu(){
    
    print(Messages.welcome.rawValue)
    
    switch true {
        
    case playerOne.fighters.count == 0  && playerTwo.fighters.count == 0 :
        
        print(Messages.chooseYourSide.rawValue)
        
        // Get player choice
        if let choice = readLine(){
            
            switch choice {
                
            case "1":
                
                //Create player one
                renamePlayer(player: playerOne)
                
            case "2":
                
                //Create player two
                renamePlayer(player: playerTwo)
                
            default:
                
                //Please select option 1 or 2
                print(ErrorMessage.chooseYourSide.rawValue)
                
                //Restart the programme
                presentMenu()
            }
        }
        
    case playerOne.fighters.count == 0:
        
        print(Messages.choosePlayerOne.rawValue)
        
        // Create player one
        renamePlayer(player: playerOne)
        
    case playerTwo.fighters.count == 0:
        
        print(Messages.choosePlayerTwo.rawValue)
        
        // Create player two
        renamePlayer(player: playerTwo)
        
    case playerOne.fighters.count == 3  && playerTwo.fighters.count == 3 :
        
        print(Messages.playersReadyToFight.rawValue)
        
        print("Player One Team:")
        for fighter in playerOne.fighters{
            print("""
                \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)
                
                
                """)
        }
        
        print("Player Two Team:")
        for fighter in playerTwo.fighters{
            print("""
                \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)
                
                
                """)
        }
        
        battleStart()
        
    default :
        presentMenu()
    }
}

// 2. Let player add his name
func renamePlayer(player: Player){
    
    print(Messages.whatIsYourName.rawValue)
    
    if let newName = readLine(){
        player.name = newName
        print("\n"
            + "\nWelcome \(player.name)"
            + "\n")
        chooseFighters(player: player)
    }
}

// 3. Player select fighters menu
func chooseFighters(player: Player){
    
    while player.fighters.count < 3 {
        
        print(Messages.chooseFighter.rawValue)
        
        for (index,fighter) in fighters.enumerated(){
            print("\(index+1).\(fighter)")
        }
        print("\nType fighter number :")
        
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
                print(ErrorMessage.chooseFighters.rawValue)
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
    askForRenaming(player: player)
}

// 4. Ask player for renaming fighters.
func askForRenaming(player: Player){
    
    print(Messages.askForRenameFighter.rawValue)
    
    if let choice = readLine(){
        switch choice.lowercased() {
        case "yes":
            
            wichFighterToRename(player: player)
            
        case "no":
            
            print(Messages.noRenaming.rawValue)
            
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
            
        default:
            
            print(ErrorMessage.yesOrNoToRename.rawValue)
            
            askForRenaming(player: player)
        }
    }
}

// 5. Select fighter to rename
func wichFighterToRename(player: Player){
    
    print(Messages.wichFighterToRename.rawValue)
    
    for (index, fighter) in player.fighters.enumerated(){
        print("\(index + 1). \(fighter.name)"
            + "\n")
    }
    
    print(Messages.finish.rawValue)
    
    if let choice = readLine() {
        switch choice {
        case "1":
            renameFighter(fighter: player.fighters[0], player: player)
            
        case "2":
            renameFighter(fighter: player.fighters[1], player: player)
            
        case "3":
            renameFighter(fighter: player.fighters[2], player: player)
            
        case "yes":
            print(Messages.renamingTerminated.rawValue)
            
            // Display player team
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
            
        default :
            print(ErrorMessage.chooseFighterToRename.rawValue)
            wichFighterToRename(player: player)
        }
    }
}

// 6. Rename fighter
func renameFighter(fighter: Character, player: Player){
    print(Messages.giveFighterNewName.rawValue)
    
    if let newName = readLine() {
        fighter.name = newName
    }
    
    wichFighterToRename(player: player)
}

// 7. Ready to fight
func chooseWhoStartFirst() -> (Player, Player) {
    let first = Int.random(in:1...2) == 1 ? playerOne : playerTwo
    let second = Int.random(in:1...2) == 2 ? playerTwo : playerOne
    return (first, second)
}

// 8. Add a weapon lotery possibility
func loteryChest(attacker: Character){
    let numbersOfFighters = 3
    let lucky = 3
    let chanceToWin = Int.random(in: 0...numbersOfFighters)
    
    if lucky == chanceToWin {
        let objects = ["Magic Fire Sword", "Magic Thunder Spear", "Mjöllnir", "Gungnir", "Caducée", "Trisula", "Vajra", "Balizarde", "Andúril", "Alastor", "Aubéclat", "Bakuzan", "Dard", "Dragon Slayer", "Dimension Sword", "Excalibur", "Glace", "Masamuné", "Master Sword", "Murasame", "Orcrist", "Sakabato", "Samehada", "Wadô Ichimonji", "Zanpakutō", "Potion 30 Health", "Potion 40 Health", "Potion 50 Health", "Potion 60 Health", "Potion 70 Health", "Potion 80 Health", "Potion 90 Health", "Potion 100 Health", "Potion 150 Health"]
        let newAttackPoint = Int.random(in:40...100)
        attacker.weapon = objects.randomElement()!
        attacker.attack = newAttackPoint
    }
}

// 9. Battle start
func battleStart(){
    
    let firstPlayer = chooseWhoStartFirst().0.name
    let secondPlayer = chooseWhoStartFirst().1.name
    
    let playerStart = firstPlayer == playerOne.name ? playerOne : playerTwo
    let playerAfter = secondPlayer == playerTwo.name ? playerTwo : playerOne
        
    fight(first: playerStart, second: playerAfter)
}

// 10. Fight !
func fight(first: Player, second: Player){
    var attacker = [Character]()
    var target = [Character]()
    
    while first.fighters.count > 0 && second.fighters.count > 0 {
        // First player attacks the second player
        print("\(first.name) select a fighter")
        // Let player choose a fighter
        // Display player team
        for (index, fighter) in (first.fighters.enumerated()){
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine() {
            switch choice {
            case "1":
                attacker.append(first.fighters[0])
            case "2":
                attacker.append(first.fighters[1])
            case "3":
                attacker.append(first.fighters[2])
            default:
                print("You can only use numbers 1,2 or 3 for choosing a fighter")
            }
        }
        // Let playerStrat select a enemy to attack
        print("\(first.name) select a enemy to attack")
        for (index, fighter) in second.fighters.enumerated() {
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine() {
            switch choice {
            case "1":
                target.append(second.fighters[0])
            case "2":
                target.append(second.fighters[1])
            case "3":
                target.append(second.fighters[2])
            default:
                print("You can only use numbers 1,2 or 3 for choosing a target")
            }
        }
        for fighter in attacker{
            loteryChest(attacker: fighter)
            fighter.attackOpponent(target: target[0])
        }
        attacker.removeAll()
        target.removeAll()
        // Second player attacks the second player
        print("\(second.name) select a fighter")
        for (index, fighter) in second.fighters.enumerated(){
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine() {
            switch choice {
            case "1":
                attacker.append(second.fighters[0])
            case "2":
                attacker.append(second.fighters[1])
            case "3":
                attacker.append(second.fighters[2])
            default:
                print("You can only use numbers 1,2 or 3 for choosing a fighter")
            }
        }
        // Let playerStrat select a enemy to attack
        print("\(second.name) select a enemy to attack")
        for (index, fighter) in first.fighters.enumerated() {
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine() {
            switch choice {
            case "1":
                target.append(first.fighters[0])
            case "2":
                target.append(first.fighters[1])
            case "3":
                target.append(first.fighters[2])
            default:
                print("You can only use numbers 1,2 or 3 for choosing a target")
            }
        }
        for fighter in attacker{
            loteryChest(attacker: fighter)
            fighter.attackOpponent(target: target[0])
        }
        attacker.removeAll()
        target.removeAll()
    }
    
}




presentMenu()
