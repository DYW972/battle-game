//
//  Enums_ErrorMessages.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 25/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

// MARK: Game error messages

enum ErrorMessage: String {
    
    case chooseYourSide = """
    
    You can only use numbers 1 or 2 to choose your side.
    
    """
    case chooseFighters = """
    
    You can only use numbers 1 to 9 for choosing a fighter.
    
    """
    case chooseFighterToRename = """
    
    You can only use numbers 1, 2 or 3 to rename a fighter.
    
    """
    case yesOrNoToRename = """
    
    You can only type yes or no to decide if you want or not rename a fighter.
    
    """
    case nameAlreadyExists = """
    
    Sorry but this name already exists in the game.
    Remember, you can only give your fighters unique name.
    
    """
    case selectFighterMenu = """
    
    You can only use numbers 1 or 2 in fighter's menu.
    
    """
    case selectFighterForAttack = """
    
    You can only use numbers 1,2 or 3 for choosing a fighter.
    
    """
    case selectFighterToHeal = """
    
    You can only use numbers 1,2,3 for choosing a target and 4 for leaving.
    
    """
    case selectTargetToAttack = """
    
    You can only use numbers 1,2 or 3 for choosing a target.
    
    """
}
