//
//  WeaponType.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 05/11/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

enum WeaponType: Int {
    case MagicFireSword = 1
    case MagicThunderSpear
    case Mjöllnir
    case Gungnir
    case MasterSword
    var damages: Int {
        switch self {
        case .MagicFireSword: return 80
        case .MagicThunderSpear: return 80
        case .Mjöllnir: return 90
        case .Gungnir: return 95
        case .MasterSword : return 100
        }
    }
    var name: String {
        switch self {
        case .MagicFireSword : return "Magic Fire Sword"
        case .MagicThunderSpear : return "Magic Thunder Spear"
        case .Mjöllnir : return "Mjöllnir"
        case .Gungnir : return "Gungnir"
        case .MasterSword : return "Master Sword"
        }
    }
}
// more weapons = ["Magic Fire Sword", "Magic Thunder Spear", "Mjöllnir", "Gungnir", "Caducée", "Trisula", "Vajra", "Balizarde", "Andúril", "Alastor", "Aubéclat", "Bakuzan", "Dard", "Dragon Slayer", "Dimension Sword", "Excalibur", "Glace", "Masamuné", "Master Sword", "Murasame", "Orcrist", "Sakabato", "Samehada", "Wadô Ichimonji", "Zanpakutō"]
