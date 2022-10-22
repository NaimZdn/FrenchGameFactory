//
//  Magus .swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Magus: Characters {
    init() {
        super.init(className: "Magus", characterHealth: 4, weaponName: "Power", weaponDamage: 2.5, talent: 0.5)
    }
}
var magus = Magus()
