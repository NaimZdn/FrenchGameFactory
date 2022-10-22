//
//  Paladin.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Paladin: Characters {
    init() {
        super.init(className: "Paladin", characterHealth: 6, weaponName: "Spear", weaponDamage: 2, talent: 0.5)
    }
}
var paladin = Paladin()

