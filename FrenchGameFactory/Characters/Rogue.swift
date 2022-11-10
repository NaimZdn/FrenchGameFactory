//
//  Rogue.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Rogue: Characters{
    init(characterName: String){
        super.init(className: "Rogue", characterDescription: "\n5.🗡 a Rogue with 4 life points. His weapons is two Daggers which inflicts 2 points of damage. With his talent the rogue use his second dagger to inflict 2 additional damage points at his opponent. ", characterName: characterName, characterHealth: 4, weaponName: "Dagger", weaponDamage: 2, talent: 2)
    }
}
