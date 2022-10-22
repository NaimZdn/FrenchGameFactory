//
//  Warrior.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Warrior: Characters {
    init() {
        super.init(className: "Warrior", characterHealth: 10, weaponName: "Sword", weaponDamage: 1, talent: -0.5)
    }
}

var warrior = Warrior()
