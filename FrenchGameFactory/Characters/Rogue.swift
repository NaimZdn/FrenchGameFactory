//
//  Rogue.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Rogue: Characters{
    init(){
        super.init(className: "Rogue", characterHealth: 4, weaponName: "Dagger", weaponDamage: 2, talent: 2)
    }
}

var rogue = Rogue()
