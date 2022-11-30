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
    override func talentActivation(attackedCharacter: Characters, playerTeam: Team) {
         //  If the character attacker is a Druid his talent healed a team character's choosing by the player with healingteam function.
            print("=============================================================")
            print("Oh your \(className) active his talent, you can choose a character to heal : ")
            print("=============================================================")
            playerTeam.statsTeam()
            healCharacter(playerTeam: playerTeam)
            attackedCharacter.characterHealth -= weaponDamage
    }
    
    // We create a function for the druid's talent
    func healCharacter(playerTeam: Team) {
        var healing: Int = 0
        repeat {
            let characterSelected = playerTeam.characterSelection() // We call the function to permit player to select a character who receive the heal.
            print("=============================================================")
            print("Your \(characterSelected.className) gain \(talent) lifepoint")
            print("=============================================================")
            characterSelected.characterHealth += talent
            healing = 1
        } while healing != 1
    }
}
