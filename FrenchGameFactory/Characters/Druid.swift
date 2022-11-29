//
//  Druid.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Druid: Characters{
    init(characterName: String) {
        super.init(className: "Druid 🦌", characterDescription: "\n4.🦌 a Druid with 6 life points. His weapon is a Stick which inflicts 1 point of damage. With his talent the druid can heal one ally.", characterName: characterName, characterHealth: 6, weaponName: "Stick", weaponDamage: 1, talent: 1)
    }
    override func talentActivation(attackedCharacter: Characters, attackerCharacter: Characters, playerTeam: Team) {
        if attackerCharacter.className == className { //  If the character attacker is a Druid his talent healed a team character's choosing by the player with healingteam function.
            print("=============================================================")
            print("Oh your \(className) active his talent, you can choose a character to heal : ")
            print("=============================================================")
            playerTeam.statsTeam()
            super.healCharacter(characterHealer: attackerCharacter, playerTeam: playerTeam)
            attackedCharacter.characterHealth -= attackerCharacter.weaponDamage
            
        }
    }
}
