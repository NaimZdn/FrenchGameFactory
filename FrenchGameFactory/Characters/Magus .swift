//
//  Magus .swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Magus: Characters {
    init(characterName: String) {
        super.init(className: "Magus 🧙‍♂️", characterDescription: "\n2.🧙‍♂️ a Magus with 4 life points. His Power inflicts 2.5 points of damage. With his talent the magus throws his oponnent with a potion which inflicts 0.5 points of damage.", characterName: characterName, characterHealth: 4, weaponName: "Power", weaponDamage: 2.5, talent: 0.5)
    }
}
