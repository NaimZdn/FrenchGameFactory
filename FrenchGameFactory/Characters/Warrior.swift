//
//  Warrior.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Warrior: Characters {
    init(characterName: String) {
        super.init(className: "Warrior",characterName: characterName, characterHealth: 10, weaponName: "Sword", weaponDamage: 1, talent: -0.5)
    }
}
