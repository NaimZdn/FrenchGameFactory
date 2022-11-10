//
//  Warrior.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Warrior: Characters {
    init(characterName: String) {
        super.init(className: "Warrior",characterDescription: "\n1.🛡 a Warrior with 10 life points. His weapon is a Sword which inflicts 1 point of damage. With his talent the warrior use his shield for protect hiself, the shield reduce 0.5 point of the opponent damages.", characterName: characterName, characterHealth: 10, weaponName: "Sword", weaponDamage: 1, talent: 0.5)
    }
}
