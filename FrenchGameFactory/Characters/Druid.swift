//
//  Druid.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Druid: Characters{
    init() {
        super.init(className: "Druid", characterHealth: 6, weaponName: "Stick", weaponDamage: 1, talent: 1)
    }
}
var druid = Druid()

