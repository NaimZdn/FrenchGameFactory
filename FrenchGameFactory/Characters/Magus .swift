//
//  Magus .swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Magus: Characters {
    init(characterName: String) {
        super.init(className: "Magus",characterName: characterName, characterHealth: 4, weaponName: "Power", weaponDamage: 2.5, talent: 0.5)
    }
}
