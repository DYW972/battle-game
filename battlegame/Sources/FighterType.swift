//
//  FighterType.swift
//  battlegame
//
//  Created by Yohan W. Dunon on 25/10/2019.
//  Copyright © 2019 Yohan William Dunon. All rights reserved.
//

import Foundation

enum FighterType: Int {
    case Thanos = 1
    case Odin
    case Zeus
    case Athena
    case Hera
    case Valkyrie
    case Groot
    case StarLord
    case Marvel
    var name: String{
        switch self {
        case .Thanos: return "Thanos"
        case .Odin: return "Odin"
        case .Zeus: return "Zeus"
        case .Athena: return "Athena"
        case .Hera: return "Hera"
        case .Valkyrie: return "Valkyrie"
        case .Groot: return "Groot"
        case .StarLord: return "StarLord"
        case .Marvel: return "Marvel"
        }
    }
}
