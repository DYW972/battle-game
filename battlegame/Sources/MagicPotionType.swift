//
//  MagicPotionType.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 05/11/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

enum MagicPotionType: Int {
    case BasicPotion = 1
    case MediumPotion
    case GodNektar
    var name: String {
        switch  self {
        case .BasicPotion: return "Basic Potion"
        case .MediumPotion: return "Medium Potion"
        case .GodNektar: return "God's Nektar"
        }
    }
    var points: Int {
        switch self {
        case .BasicPotion: return 25
        case .MediumPotion: return 50
        case .GodNektar: return 100
        }
    }
}
