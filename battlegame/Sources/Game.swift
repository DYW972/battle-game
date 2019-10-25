//
//  Class_Game.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 25/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

class Game {
    // MARK: PROPERTIES
    var playerOne: Player
    var playerTwo: Player
    let fighters = ["Thanos","Odin","Zeus","Athena","Hera","Valkyrie","Groot","StarLord","Marvel"]
    var hallOfFamous = [String : [Character]]()
    
    // MARK: INITIALIZER
    
    init(playerOne: Player, playerTwo: Player){
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    // MARK: METHODS
    
    /// Game menu start
    func presentMenu(){
        print(Messages.welcome.rawValue)
        switch true {
        case playerOne.fighters.count == 0  && playerTwo.fighters.count == 0 :
            print(Messages.chooseYourSide.rawValue)
            if let choice = readLine(){
                switch choice {
                case "1":
                    renamePlayer(player: playerOne)
                case "2":
                    renamePlayer(player: playerTwo)
                case "3":
                    if hallOfFamous.count > 0 {
                        showHallOfFame()
                        presentMenu()
                    } else {
                        print("""

                            Hall of Fame still empty...
                            Fight for your name here !

                            """)
                        presentMenu()
                    }
                default:
                    print(ErrorMessage.chooseYourSide.rawValue)
                    presentMenu()
                }
            }
        case playerOne.fighters.count == 0:
            print(Messages.choosePlayerOne.rawValue)
            renamePlayer(player: playerOne)
        case playerTwo.fighters.count == 0:
            print(Messages.choosePlayerTwo.rawValue)
            renamePlayer(player: playerTwo)
        case playerOne.fighters.count == 3  && playerTwo.fighters.count == 3 :
            print(Messages.playersReadyToFight.rawValue)
            print(showPlayerTeam(player: playerOne))
            print(showPlayerTeam(player: playerTwo))
            fight(first: playerOne, second: playerTwo)
        default :
            presentMenu()
        }
    }
    
    /// Let player add his name
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
    
    /// Player select fighters menu
    func chooseFighters(player: Player){
        while player.fighters.count < 3 {
            print(Messages.chooseFighter.rawValue)
            for (index,fighter) in fighters.enumerated(){
                print("\(index+1).\(fighter)")
            }
            print("\nType fighter number :")
            if let choice = readLine(), let choiceInt = Int(choice), let fighter = FighterType(rawValue: choiceInt)  {
                player.fighters.append(Character(name: fighter.name))
                print("\n"
                    + "\nThere is \(player.fighters.count) figthers in your team:")
                for fighter in player.fighters{
                    print("\n\(fighter.name)")
                }
            } else {
                chooseFighters(player: player)
            }
        }
        askForRenaming(player: player)
    }
    
    /// Show player fighters
    func showPlayerTeam(player: Player) -> String {
        var message = """
        \(player.name) Team:
        
        """
        for fighter in player.fighters{
            message += """
            \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)
            
            
            """
        }
        return message
    }
    
    /// Ask player for renaming fighters.
    func askForRenaming(player: Player){
        print(Messages.askForRenameFighter.rawValue)
        if let choice = readLine(){
            switch choice.lowercased() {
            case "yes":
                selectFighterToRename(player: player)
            case "no":
                print(Messages.noRenaming.rawValue)
                print(showPlayerTeam(player: player))
                presentMenu()
            default:
                print(ErrorMessage.yesOrNoToRename.rawValue)
                askForRenaming(player: player)
            }
        }
    }
    
    /// Select fighter to rename
    func selectFighterToRename(player: Player){
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
                print(showPlayerTeam(player: player))
                presentMenu()
            default :
                print(ErrorMessage.chooseFighterToRename.rawValue)
                selectFighterToRename(player: player)
            }
        }
    }
    
    /// Rename fighter
    func renameFighter(fighter: Character, player: Player){
        print(Messages.giveFighterNewName.rawValue)
        if let newName = readLine() {
            if player.fighters.contains(where:{$0.name == newName}){
                print(Messages.nameAlreadyExists.rawValue)
            } else {
                fighter.name = newName
            }
        }
        selectFighterToRename(player: player)
    }
    
    /// Add an object lotery
    func loteryChest(attacker: Character){
        let numbersOfFighters = 3
        let lucky = 1
        let chanceToWin = Int.random(in: 1...numbersOfFighters)
        if lucky == chanceToWin {
            let objects = ["Magic Fire Sword", "Magic Thunder Spear", "Mjöllnir", "Gungnir", "Caducée", "Trisula", "Vajra", "Balizarde", "Andúril", "Alastor", "Aubéclat", "Bakuzan", "Dard", "Dragon Slayer", "Dimension Sword", "Excalibur", "Glace", "Masamuné", "Master Sword", "Murasame", "Orcrist", "Sakabato", "Samehada", "Wadô Ichimonji", "Zanpakutō"]
            let newAttackPoint = Int.random(in:50...100)
            // ADD ONLY ONE POTION
            //            let healingPotions = ["Potion": 30, "Potion": 40, "Potion": 50, "Potion": 60, "Potion": 70, "Potion": 80, "Potion": 90, "Potion": 100, "Potion": 150]
            attacker.weapon = objects.randomElement()!
            attacker.attack = newAttackPoint
        }
    }
    
    /// Select attacker
    func selectAttacker(first: Player, second:Player){
        print("""
            
            \(first.name) select a fighter
            
            """)
        for (index, fighter) in (first.fighters.enumerated()){
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine(), let choiceInt = Int(choice) {
            switch choice {
            case "1":
                handleTarget(firstPlayer: first, secondPlayer: second, attackerIndex: choiceInt - 1)
            case "2":
                let attackerIndex = choiceInt - 1
                let targetIndex =  selectTarget(first: first, second: second)
                let targetEnemy = second.fighters[targetIndex]
                loteryChest(attacker: first.fighters[attackerIndex])
                first.fighters[attackerIndex].attackOpponent(target: targetEnemy)
            case "3":
                let attackerIndex = choiceInt - 1
                let targetIndex =  selectTarget(first: first, second: second)
                let targetEnemy = second.fighters[targetIndex]
                loteryChest(attacker: first.fighters[attackerIndex])
                first.fighters[attackerIndex].attackOpponent(target: targetEnemy)
            default:
                print("You can only use numbers 1,2 or 3 for choosing a fighter")
                selectAttacker(first: first, second: second)
            }
        }
    }
    
    /// Select target
    func selectTarget(first:Player,second:Player) -> Int {
        var target = Int()
        print("""
            
            \(first.name) select a enemy to attack
            
            """)
        for (index, fighter) in second.fighters.enumerated() {
            print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)")
        }
        if let choice = readLine(), let choiceInt = Int(choice) {
            switch choice {
            case "1" :
                target = choiceInt - 1
            case "2" :
                target = choiceInt - 1
            case "3" :
                target = choiceInt - 1
            default :
                print("You can only use numbers 1,2 or 3 for choosing a target")
                fight(first: first, second: second)
            }
        }
        return target
    }
    
    /// Handle target
    func handleTarget(firstPlayer:Player, secondPlayer:Player, attackerIndex: Int){
        let targetIndex =  selectTarget(first: firstPlayer, second: secondPlayer)
        let targetEnemy = secondPlayer.fighters[targetIndex]
        loteryChest(attacker: firstPlayer.fighters[attackerIndex])
        firstPlayer.fighters[attackerIndex].attackOpponent(target: targetEnemy)
    }
    
    /// Main Fight Method
    func fight(first: Player, second: Player){
        print(Messages.fight.rawValue)
        while true {
            // Player One Round
            selectAttacker(first: first, second: second)
            winner(first: first, second: second)
            // Player Two Round
            selectAttacker(first: second, second: first)
            winner(first: first, second: second)
        }
    }
    
    /// Check if winner
    func winner(first:Player, second:Player) {
        if first.fighters.allSatisfy({$0.isDead == true}) {
            hallOfFame(winner: second)
        } else if second.fighters.allSatisfy({$0.isDead == true}) {
            hallOfFame(winner: first)
        }
    }
    
    /// Add winner to Hall Of Fame
    func hallOfFame(winner: Player) {
        print("\(winner.name) win the battle !")
        for (index, fighter) in winner.fighters.enumerated() {
            print("""
                \(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)
                
                """)
        }
        hallOfFamous[winner.name] = winner.fighters
        playerOne.fighters.removeAll()
        playerTwo.fighters.removeAll()
        presentMenu()
    }
    
    /// Display Hall Of Fame
    func showHallOfFame(){
        for (winner,fighters) in hallOfFamous {
            print("""
                \(winner)
                """)
            for (index, fighter) in fighters.enumerated(){
                print("""
                    \(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.attack)    ⚔️  :\(fighter.weapon)
                    
                    """)
            }
            print("=========================================")
        }
    }
    
}
