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
    
    let welcomeMessage = Messages.welcome.rawValue
    print(welcomeMessage)
    
    switch true {
        
    case playerOne.fighters.count == 0  && playerTwo.fighters.count == 0 :
        
        let chooseYourSideMessage = Messages.chooseYourSide.rawValue
        print(chooseYourSideMessage)
        
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
                let only1or2ErrorMessage = ErrorMessage.chooseYourSide.rawValue
                print(only1or2ErrorMessage)
                
                //Restart the programme
                presentMenu()
            }
        }
        
    case playerOne.fighters.count == 0:
        
        let choosePlayerOneMessage = Messages.choosePlayerOne.rawValue
        print(choosePlayerOneMessage)
        
        // Create player one
        renamePlayer(player: playerOne)
        
    case playerTwo.fighters.count == 0:
        
        let choosePlayerTwoMessage = Messages.choosePlayerTwo.rawValue
        print(choosePlayerTwoMessage)
        
        // Create player two
        renamePlayer(player: playerTwo)
        
    case playerOne.fighters.count == 3  && playerTwo.fighters.count == 3 :
        
        let playersReadyToFightMessage = Messages.playersReadyToFight.rawValue
        print(playersReadyToFightMessage)
        
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
    default :
        presentMenu()
    }
}

// 2. Let player add his name
func renamePlayer(player: Player){
    
    let whatIsYourName = Messages.whatIsYourName.rawValue
    print(whatIsYourName)
    
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

// 4. Ask player for renaming fighters.
func askForRenaming(player: Player){
    
    let askForRenameFighterMessage = Messages.askForRenameFighter.rawValue
    let noRenamingMessage = Messages.noRenaming.rawValue
    let yesOrNoErrorMessage = ErrorMessage.yesOrNoToRename.rawValue
    
    print(askForRenameFighterMessage)
    
    if let choice = readLine(){
        switch choice.lowercased() {
        case "yes":
            
            wichFighterToRename(player: player)
            
        case "no":
            
            print(noRenamingMessage)
            
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
            
        default:
            
            print(yesOrNoErrorMessage)
            
            askForRenaming(player: player)
        }
    }
}

// 5. Select fighter to rename
func wichFighterToRename(player: Player){
    
    let wichFighterYouWantToRenameMessage = Messages.wichFighterToRename.rawValue
    let finishMessage = Messages.finish.rawValue
    let renamingTerminatedMessage = Messages.renamingTerminated.rawValue
    let chooseFighterToRenameErrorMessage = ErrorMessage.chooseFigterToRename.rawValue
    
    print(wichFighterYouWantToRenameMessage)
    
    for (index, fighter) in player.fighters.enumerated(){
        print("\(index + 1). \(fighter.name)"
            + "\n")
    }
    
    print(finishMessage)
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print(player.fighters[0].name)
            renameFighter(fighter: player.fighters[0], player: player)
            
        case "2":
            print(player.fighters[1].name)
            renameFighter(fighter: player.fighters[1], player: player)
            
        case "3":
            print(player.fighters[2].name)
            renameFighter(fighter: player.fighters[2], player: player)
            
        case "yes":
            print(renamingTerminatedMessage)
            
            // Display player team
            for fighter in player.fighters{
                print("\n\(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
            }
            presentMenu()
            
        default :
            print(chooseFighterToRenameErrorMessage)
            wichFighterToRename(player: player)
        }
    }
}

func renameFighter(fighter: Character, player: Player){
    let giveFighterNewNameMessage = Messages.giveFighterNewName.rawValue
    print(giveFighterNewNameMessage)
    
    if let newName = readLine() {
        fighter.name = newName
    }
    
    wichFighterToRename(player: player)
}

// Add a super weapon lotery possibility function
func weaponChest(attacker: Character){
    let weapons = ["Magic Fire Sword", "Magic Thunder Spear", "Mjöllnir", "Gungnir", "Caducée", "Trisula", "Vajra", "Balizarde", "Andúril", "Alastor", "Aubéclat", "Bakuzan", "Dard", "Dragon Slayer", "Dimension Sword", "Excalibur", "Glace", "Masamuné", "Master Sword", "Murasame", "Orcrist", "Sakabato", "Samehada", "Wadô Ichimonji", "Zanpakutō"]
    let newAttackPoint = Int.random(in:0..<100)
    attacker.weapon = weapons.randomElement()!
    attacker.attack = newAttackPoint
}

presentMenu()
