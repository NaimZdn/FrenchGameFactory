//
//  Rogue.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Rogue: Characters{
    init(characterName: String){
        super.init(className: "Rogue", characterName: characterName, characterHealth: 4, weaponName: "Dagger", weaponDamage: 2, talent: 2)
    }
}
