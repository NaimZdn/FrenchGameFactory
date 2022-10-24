//
//  Druid.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Druid: Characters{
    init(characterName: String) {
        super.init(className: "Druid", characterName: characterName, characterHealth: 6, weaponName: "Stick", weaponDamage: 1, talent: 1)
    }
}
