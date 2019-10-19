//
//  Enums.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation
// Characters
enum Characters: String {
    case Thanos
    case Odin
    case Zeus
    case Athena
    case Hera
    case Valkyrie
    case Groot
    case StarLord
    case Marvel
}

// Messages
enum Messages: String {
    case welcome = """
    
    ============================
    == Welcome in Battle Game ==
    ============================
    """
    case chooseYourSide = """
    Choose your side:
    1. Player One
    2. Player Two
    """
    case choosePlayerOne = """
    Player Two is ready to fight.
    Let Player One prepare for fight.
    
    """
    case choosePlayerTwo = """
    Player One is ready to fight.
    Let Player Two prepare for fight.
    
    """
    case whatIsYourName = """
    What's your Name ?
    
    """
    case askForRenameFighter = """
    Do you want to rename your figthers? yes/no
    
    """
    case wichFighterToRename = """
    Wich fighter you want to rename ?
    
    """
    case giveFighterNewName = """
    What's the new name of this fighter ?
    
    """
    case finish = """
    Finish ?  Type: yes
    
    """
    case renamingTerminated = """
    Renaming terminated
    Now take a look at your team :
    
    """
    case noRenaming = """
    Now take a look at your team :
    
    """
    case playersReadyToFight = """
    Well done! Both of you are ready to fight !
    
    
    """
    
}

enum ErrorMessage: String {
    case chooseYourSide = """
    You can only use numbers 1 or 2 to choose your side.
    
    """
    case chooseFigterToRename = """
    You can only use numbers 1, 2 or 3 to rename a fighter.
    
    """
    case yesOrNoToRename = """
    You can only type yes or no to decide if you want or not rename a fighter.
    
    """
}
