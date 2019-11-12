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
            guard let choice = readLine() else {return}
            switch choice {
            case "1":
                renamePlayer(player: playerOne)
            case "2":
                renamePlayer(player: playerTwo)
            default:
                print(ErrorMessage.chooseYourSide.rawValue)
                presentMenu()
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
    
    /// Let player add a name
    func renamePlayer(player: Player){
        print(Messages.whatIsYourName.rawValue)
        guard let newName = readLine() else {return}
        player.name = newName
        print("\n"
            + "\nWelcome \(player.name)"
            + "\n")
        chooseFighters(player: player)
    }
    
    /// Player select fighters
    func chooseFighters(player: Player){
        while player.fighters.count < 3 {
            print(Messages.chooseFighter.rawValue)
            for (index,fighter) in fighters.enumerated(){
                print("\(index+1).\(fighter)")
            }
            print("\nType fighter number :")
            guard let choice = readLine(), let choiceInt = Int(choice), let fighter = FighterType(rawValue: choiceInt) else{
                print(ErrorMessage.chooseFighters.rawValue)
                chooseFighters(player: player)
                return
            }
            player.fighters.append(Character(name: fighter.name))
            print("\n"
                + "\nThere is \(player.fighters.count) figthers in your team:")
            for fighter in player.fighters{
                print("\n\(fighter.name)")
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
            \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.weapon.damages)    ⚔️  :\(fighter.weapon.name)    🧪:\(fighter.potion)
            
            
            """
        }
        return message
    }
    
    /// Rename fighters
    func askForRenaming(player: Player){
        print(Messages.askForRenameFighter.rawValue)
        guard let choice = readLine() else {return}
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
    
    /// Select fighter to rename
    func selectFighterToRename(player: Player){
        print(Messages.wichFighterToRename.rawValue)
        for (index, fighter) in player.fighters.enumerated(){
            print("\(index + 1). \(fighter.name)"
                + "\n")
        }
        print(Messages.finish.rawValue)
        guard let choice = readLine(), let choiceInt = Int(choice) else {return}
        switch choiceInt {
        case 1, 2, 3:
            renameFighter(fighter: player.fighters[choiceInt-1], player: player)
        case 4:
            print(Messages.renamingTerminated.rawValue)
            print(showPlayerTeam(player: player))
            presentMenu()
        default :
            print(ErrorMessage.chooseFighterToRename.rawValue)
            selectFighterToRename(player: player)
        }
    }
    
    /// Rename fighter
    func renameFighter(fighter: Character, player: Player){
        print(Messages.giveFighterNewName.rawValue)
        guard let newName = readLine() else {return}
        if player.fighters.contains(where:{$0.name == newName}){
            print(Messages.nameAlreadyExists.rawValue)
        } else {
            fighter.name = newName
        }
        selectFighterToRename(player: player)
    }
    
    /// Select attacker
    func selectAttacker(first: Player, second:Player){
        print("""
            
            \(first.name) Select a fighter :
            
            """)
        for (index, fighter) in (first.fighters.enumerated()){
            if fighter.isDead == false {
                print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.weapon.damages)    ⚔️  :\(fighter.weapon.name)    🧪:\(fighter.potion)")
            }
        }
        guard let choice = readLine(), let choiceInt = Int(choice) else {return}
        switch choiceInt {
        case 1, 2, 3 :
            if first.fighters[choiceInt - 1].isDead == false {
                selectedFighterMenu(firstPlayer:first, secondPlayer:second, attacker: choiceInt - 1)
            } else {
                print("Sorry but \(first.fighters[choiceInt - 1].name) is dead and can't be called for fight !")
                selectAttacker(first: first, second: second)
            }
        default:
            print(ErrorMessage.selectFighterForAttack.rawValue)
            selectAttacker(first: first, second: second)
        }
    }
    
    /// Selected fighter menu
    func selectedFighterMenu(firstPlayer:Player, secondPlayer:Player, attacker: Int){
        print("""
            
            Select an option :
            
            """)
        print(Messages.selectedFighterMenu.rawValue)
        guard let choice = readLine() else {return}
        switch choice {
        case "1":
            // Attack menu
            handleTarget(firstPlayer: firstPlayer, secondPlayer: secondPlayer, attackerIndex: attacker)
        case "2":
            //Select menu for healing
            selectFighterToHeal(firstPlayer: firstPlayer, secondPlayer: secondPlayer, fighterIndex: attacker)
        default:
            print(ErrorMessage.selectFighterMenu.rawValue)
            selectedFighterMenu(firstPlayer:firstPlayer, secondPlayer:secondPlayer, attacker: attacker)
        }
    }
    
    /// Select fighter to heal menu:
    func selectFighterToHeal(firstPlayer: Player, secondPlayer: Player, fighterIndex: Int){
        print("""
            
            Select a fighter to heal :
            
            """)
        for (index, fighter) in (firstPlayer.fighters.enumerated()){
            if fighter.isDead == false {
                print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.weapon.damages)    ⚔️  :\(fighter.weapon.name)    🧪:\(fighter.potion)")
            }
        }
        print("4. Back to selected fighter menu")
        guard let choice = readLine(), let choiceInt = Int(choice) else {return}
        switch choiceInt {
        case 1, 2, 3 :
            // select first fighter
            if firstPlayer.fighters[fighterIndex].healTeammate(target: firstPlayer.fighters[choiceInt - 1]) == false {
                selectedFighterMenu(firstPlayer:firstPlayer, secondPlayer:secondPlayer, attacker: fighterIndex)
            }
        case 4:
            // back to select fighter menu
            selectedFighterMenu(firstPlayer:firstPlayer, secondPlayer:secondPlayer, attacker: fighterIndex)
        default :
            print(ErrorMessage.selectFighterToHeal.rawValue)
            selectFighterToHeal(firstPlayer: firstPlayer,secondPlayer:secondPlayer, fighterIndex: fighterIndex)
        }
    }
    
    /// Select target to attack
    func selectTargetToAttack(first:Player,second:Player) -> Int {
        var target = Int()
        print("""
            
            \(first.name) select a enemy to attack
            
            """)
        for (index, fighter) in second.fighters.enumerated() {
            if fighter.isDead == false {
                print("\n\(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.weapon.damages)    ⚔️  :\(fighter.weapon.name)    🧪:\(fighter.potion)")
            }
        }
        guard let choice = readLine(), let choiceInt = Int(choice) else {return 10}
        switch choiceInt {
        case 1, 2, 3 :
            if second.fighters[choiceInt - 1].isDead == false {
                target = choiceInt - 1
            } else {
                print("Sorry but \(second.fighters[choiceInt - 1].name) is dead and can't be attacked !")
                fight(first: first, second: second)
            }
        default :
            print(ErrorMessage.selectTargetToAttack.rawValue)
            fight(first: first, second: second)
        }
        return target
    }
    
    /// Handle target
    func handleTarget(firstPlayer:Player, secondPlayer:Player, attackerIndex: Int){
        let targetIndex =  selectTargetToAttack(first: firstPlayer, second: secondPlayer)
        let targetEnemy = secondPlayer.fighters[targetIndex]
        lottery(attacker: firstPlayer.fighters[attackerIndex])
        firstPlayer.fighters[attackerIndex].attackOpponent(target: targetEnemy)
    }
    
    /// Magic objects lottery
    func lottery(attacker: Character){
        if Int.random(in: 1...10) == 1 {
            guard let randomWeapon = WeaponType(rawValue: Int.random(in:1...5)) else {return}
            let newWeapon = Weapon(name: randomWeapon.name, damages: randomWeapon.damages)
            attacker.weapon = newWeapon
        } else if Int.random(in: 1...10) == 5 {
            guard let randomPotion = MagicPotionType(rawValue: Int.random(in:1...3)) else {return}
            attacker.potion = randomPotion.name
            attacker.healingPoints = randomPotion.points
        }
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
    
    /// Display Winner
    func hallOfFame(winner: Player) {
        print("""
            
            
            
            \(winner.name) win the battle !
            
            """)
        for (index, fighter) in winner.fighters.enumerated() {
            print("""
                \(index+1). \(fighter.name)     ❤️  :\(fighter.health)    💥:\(fighter.weapon.damages)    ⚔️  :\(fighter.weapon.name)    🧪:\(fighter.potion)
                
                """)
        }
        playerOne.fighters.removeAll()
        playerTwo.fighters.removeAll()
        presentMenu()
    }
}
