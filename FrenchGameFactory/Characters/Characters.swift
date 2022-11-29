//
//  Characters.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 22/10/2022.
//

import Foundation

class Characters {
    var className: String;
    var characterDescription: String;
    var characterName: String;
    var weaponName: String;
    var weaponDamage: Double;
    var talent: Double;
    var characterHealth: Double {
        didSet {
            // We display lifepoints after the fight.
            if oldValue > characterHealth {
                print("Your opponent \(className) has now \(characterHealth) lifepoints !")
                print("=============================================================")
                
            } else if oldValue > characterHealth && characterHealth == 1 {
                print("=============================================================")
                print("Your opponent \(className) has now \(characterHealth) lifepoint !")
                print("=============================================================")
                
            }
        }
    }
    
    init(className: String, characterDescription: String, characterName: String, characterHealth: Double, weaponName: String, weaponDamage: Double, talent: Double) {
        self.className = className
        self.characterDescription = characterDescription
        self.characterName = characterName
        self.characterHealth = characterHealth
        self.weaponName = weaponName
        self.weaponDamage = weaponDamage
        self.talent = talent
    }
    
    // We create a function to make the attacks during the fight.
    func attack(attackedCharacter: Characters, attackerCharacter: Characters, playerTeam: Team) {
        if attackedCharacter.characterHealth <= 0 { // If the attacked character lifepoint is less than 0, we print an error message because he is dead.
            print("=============================================================")
            print("This character is dead")
            print("=============================================================")
        } else {
            let randomActivation = Int.random(in: 0..<3) // We set a percentage so that the character has a 33% chance to activate his talent.
            if randomActivation == 0 {
                    // Talent activation for the other character.
                    talentActivation(attackedCharacter: attackedCharacter, attackerCharacter: attackerCharacter, playerTeam: playerTeam)
    
            } else { // If the talent isn't activate.
                attackedCharacter.characterHealth -= attackerCharacter.weaponDamage
            }
            if attackedCharacter.characterHealth <= 0 { // If there lifepoints of the character attacked is reduce to 0, we can print this following message.
                print("=============================================================")
                print("Congratulation, you kill his \(attackedCharacter.className)")
                print("=============================================================")
            }
        }
    }
    
    func talentActivation(attackedCharacter: Characters, attackerCharacter: Characters, playerTeam: Team) {
        print("=============================================================")
        print("Oh ! Your \(attackerCharacter.className) active his talent")
        print("=============================================================")
        attackedCharacter.characterHealth -= attackerCharacter.weaponDamage
        attackedCharacter.characterHealth -= attackerCharacter.talent
    }
    
    
    // We create a function for the druid's talent
     func healCharacter(characterHealer: Characters, playerTeam: Team) {
        var healing: Int = 0
        repeat {
            let characterSelected = playerTeam.characterSelection() // We call the function to permit player to select a character who receive the heal.
            print("=============================================================")
            print("Your \(characterSelected.className) gain \(characterSelected.talent) lifepoint")
            print("=============================================================")
            characterSelected.characterHealth += characterHealer.talent
            healing = 1
        } while healing != 1
    }
}
