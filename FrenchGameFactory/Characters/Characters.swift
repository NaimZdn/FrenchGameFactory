//
//  Characters.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation
class Characters {
    var className: String;
    var characterName: String;
    var characterHealth: Double;
    var weaponName: String;
    var weaponDamage: Double;
    var talent: Double;
    
    init(className: String, characterName: String, characterHealth: Double, weaponName: String, weaponDamage: Double, talent: Double) {
        self.className = className;
        self.characterName = characterName
        self.characterHealth = characterHealth;
        self.weaponName = weaponName;
        self.weaponDamage = weaponDamage;
        self.talent = talent;
    }
}
