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
            if oldValue > characterHealth { // We display lifepoints after the fight.
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
    
    func attackTeam(characterAttacked: Characters, characterAttacker: Characters, playerTeam: Team) {
        
        if characterAttacked.characterHealth <= 0 { // If the attacked character lifepoint is less than 0, we print an error message because he is dead.
            print("=============================================================")
            print("This character is dead")
            print("=============================================================")
        } else {
            let randomActivation = Int.random(in: 0..<3) //We set a percentage so that the character has a 33% chance to activate his talent.
            if randomActivation == 0 {
                if characterAttacked.className == "Warrior 🛡" { // If the character attacked is a Warrior his talent is reducing damage to 0.5 point.
                    print("=============================================================")
                    print("Oh ! Opponent Warrior's 🛡 make a shield for reduce your attack")
                    print("=============================================================")
                    let damageReduce: Double = characterAttacker.weaponDamage - characterAttacked.talent
                    characterAttacked.characterHealth -= damageReduce
                    
                } else if characterAttacker.className == "Druid 🦌" { //  If the character attacker is a Druid his talent healed a team character's choosing by the player with healingteam function.
                    print("=============================================================")
                    print("Oh your \(characterAttacker.className) active his talent, you can choose a character to heal : ")
                    print("=============================================================")
                    playerTeam.statsTeam()
                    healingTeamCharacter(charactersHealer: characterAttacker, playerTeam: playerTeam)
                    characterAttacked.characterHealth -= characterAttacker.weaponDamage
                    
                } else if characterAttacker.className != "Warrior 🛡"{ // Talent activation for the other character.
                    print("=============================================================")
                    print("Oh ! Your \(characterAttacker.className) active his talent")
                    print("=============================================================")
                    characterAttacked.characterHealth -= characterAttacker.weaponDamage
                    characterAttacked.characterHealth -= characterAttacker.talent
                    
                }
                
            } else { // If the talent isn't activate.
                characterAttacked.characterHealth -= characterAttacker.weaponDamage
            }
            if characterAttacked.characterHealth <= 0 { // If there lifepoints of the character attacked is reduce to 0, we can print this following message.
                print("=============================================================")
                print("Congratulation, you kill his \(characterAttacked.className)")
                print("=============================================================")
            }
        }
    }
    
    func healingTeamCharacter(charactersHealer: Characters, playerTeam: Team) {
        var healing: Int = 0
        repeat {
            let characterSelected = playerTeam.characterSelection()
            print("=============================================================")
            print("Your \(characterSelected.className) gain 1 lifepoint")
            print("=============================================================")
            characterSelected.characterHealth += charactersHealer.talent
            healing = 1
        } while healing != 1
    }
}
