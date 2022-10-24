//
//  Paladin.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Paladin: Characters {
    init(characterName: String) {
        super.init(className: "Paladin",characterName: characterName, characterHealth: 6, weaponName: "Spear", weaponDamage: 2, talent: 0.5)
    }
}
