//
//  Paladin.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Paladin: Characters {
    init(characterName: String) {
        super.init(className: "Paladin 🏇",characterDescription: "\n3.🏇 a Paladin with 6 life points. His weapon is a Spear which inflicts 2 points of damage. With his talent the paladin's horse inflicts 0.5 points of damage at the opponnent.", characterName: characterName, characterHealth: 6, weaponName: "Spear", weaponDamage: 2, talent: 0.5)
    }
}
