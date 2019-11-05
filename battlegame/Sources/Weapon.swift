//
//  Weapon.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 05/11/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

class Weapon {
    var name: String
    var damages: Int
    
    init(name:String, damages:Int){
        self.name = name
        self.damages = damages
    }
}
