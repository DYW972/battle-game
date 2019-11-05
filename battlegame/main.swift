//
//  main.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 19/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

// MARK: PROPERTIES

var playerOne = Player(name:"PlayerOne")
var playerTwo = Player(name:"PlayerTwo")
var newGame = Game(playerOne: playerOne, playerTwo: playerTwo)

// MARK: START THE GAME
newGame.presentMenu()

