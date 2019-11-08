//
//  Enums.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

// Messages
enum Messages: String {
    case welcome = """
    
    ============================
    == Welcome in Battle Game ==
    ============================
    
    1v1 fight game :
    - Choose 3 fighters
    - Attack or Heal
    - Kill them all = Win
    
    Ready to fight ?
    
    """
    case chooseYourSide = """
    
    Make your choice :
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
    case chooseFighter = """
    
    Choose 3 fighters to add in your team :
    
    """
    case askForRenameFighter = """
    
    Now you have 3 fighters in your team,
    you can give them a new name if you want
    
    Do you want to rename your figthers? yes/no
    
    """
    case wichFighterToRename = """
    
    Wich fighter you want to rename ?
    
    """
    case giveFighterNewName = """
    
    What's the new name of this fighter ?
    
    """
    case nameAlreadyExists = """
    
    This name already exists in your team.
    Please give a unique name.
    
    """
    case finish = """
    
    4. yes
    
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
    case fight = """
    
    Get ready...
    Fight !
    
    """
    case selectedFighterMenu = """
    
    1. Attack
    2. Heal
    
    """
}
