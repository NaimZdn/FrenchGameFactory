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
            if oldValue < characterHealth && className == "Warrior" {
                print("=============================================================")
                print("Oh, with his shield, your opponent reduce his damage by \(characterHealth - oldValue)")
                print("=============================================================")
            } else if oldValue < characterHealth && className == "Druid" {
                print("=============================================================")
                print("Oh ! With his talent your Druid heal one of your characters, his lifepoints increase by 1 ")
                print("=============================================================")
            }
        }
    }

    init(className: String, characterDescription: String, characterName: String, characterHealth: Double, weaponName: String, weaponDamage: Double, talent: Double) {
        self.className = className;
        self.characterDescription = characterDescription;
        self.characterName = characterName
        self.characterHealth = characterHealth;
        self.weaponName = weaponName;
        self.weaponDamage = weaponDamage;
        self.talent = talent;
    }
    
    func attackTeam1(attackedTeam1: Characters, attackerTeam2: Characters) {
        if attackedTeam1.characterHealth > 0 {
            if attackedTeam1.characterHealth <= 0 {
                print("=============================================================")
                print("This character is dead")
                print("=============================================================")
            } else {
                let randomActivation = Int.random(in: 0..<3)
                if randomActivation == 0 {
                    if attackedTeam1.className == "Warrior" {
                        print("=============================================================")
                        print("Oh ! Opponent Warrior's make a shield for reduce your attack")
                        print("=============================================================")
                        let damageReduce: Double = attackerTeam2.weaponDamage - attackedTeam1.talent
                        attackedTeam1.characterHealth -= damageReduce
                    } else if attackerTeam2.className != "Druid" && attackerTeam2.className != "Warrior"{
                        print("=============================================================")
                        print("Oh ! Your character active his talent")
                        print("=============================================================")
                        attackedTeam1.characterHealth -= attackerTeam2.weaponDamage
                        attackedTeam1.characterHealth -= attackerTeam2.talent
                        
                    } else if attackerTeam2.className == "Druid" {
                        print("=============================================================")
                        print("Oh your Druid active his talent, you can choose a character to heal : ")
                        print("=============================================================")
                        player2Team.statsTeam2()
                        heallingTeam2()
                        attackedTeam1.characterHealth -= attackerTeam2.weaponDamage
                        
                    }else if attackerTeam2.className == "Warrior" {
                        attackedTeam1.characterHealth -= attackerTeam2.weaponDamage
                    }
        
                } else {
                    attackedTeam1.characterHealth -= attackerTeam2.weaponDamage
                }
                if attackedTeam1.characterHealth <= 0 {
                    print("=============================================================")
                    print("Congratulation, you kill his \(attackedTeam1.className)")
                    print("=============================================================")
                }
            }
        }
    }
    
    func attackTeam2(attackedTeam2: Characters, attackerTeam1: Characters) {
        if attackedTeam2.characterHealth > 0 {
            if attackedTeam2.characterHealth <= 0 {
                print("=============================================================")
                print("This character is dead")
                print("=============================================================")
            } else {
                let randomActivation = Int.random(in: 0..<3)
                if randomActivation == 0 {
                    if attackedTeam2.className == "Warrior" {
                        print("=============================================================")
                        print("Oh ! Opponent Warrior's make a shield for reduce your attack")
                        print("=============================================================")
                        let damageReduce: Double = attackerTeam1.weaponDamage - attackedTeam2.talent
                        attackedTeam2.characterHealth -= damageReduce
                    } else if attackerTeam1.className != "Druid" && attackerTeam1.className != "Warrior"{
                        print("=============================================================")
                        print("Oh ! Your character active his talent")
                        print("=============================================================")
                        attackedTeam2.characterHealth -= attackerTeam1.weaponDamage
                        attackedTeam2.characterHealth -= attackerTeam1.talent
                    }  else if attackerTeam1.className == "Druid" {
                        print("=============================================================")
                        print("Oh your Druid active his talent, you can choose a character to heal : ")
                        print("=============================================================")
                        player1Team.statsTeam1()
                        heallingTeam1()
                        attackedTeam2.characterHealth -= attackerTeam1.weaponDamage
                        
                    } else if attackerTeam1.className == "Warrior" {
                        attackedTeam2.characterHealth -= attackerTeam1.weaponDamage
                    }
        
                } else {
                    attackedTeam2.characterHealth -= attackerTeam1.weaponDamage
                }
                if attackedTeam2.characterHealth <= 0 {
                    print("=============================================================")
                    print("Congratulation, you kill his \(attackedTeam2.className)")
                    print("=============================================================")
                }
            }
        }
        
    }
    func heallingTeam1() {
        if let characterToHeal = readLine() {
            switch characterToHeal {
            case "1":
                if player1Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam1()
                } else {
                    print("=============================================================")
                    print("Your Warrior gain 1 lifepoint")
                    print("=============================================================")
                    player1Team.teamComposition[1]!.characterHealth += player1Team.teamComposition[4]!.talent
                }
            case "2":
                if player1Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam1()
                } else {
                    print("=============================================================")
                    print("Your Magus gain 1 lifepoint")
                    print("=============================================================")
                    player1Team.teamComposition[2]!.characterHealth += player1Team.teamComposition[4]!.talent
                }
            case "3":
                if player1Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam1()
                } else {
                    print("=============================================================")
                    print("Your Paladin gain 1 lifepoint")
                    print("=============================================================")
                    player1Team.teamComposition[3]!.characterHealth += player1Team.teamComposition[4]!.talent
                }
            case "4":
                if player1Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam1()
                } else {
                    print("=============================================================")
                    print("Your Druid gain 1 lifepoint")
                    print("=============================================================")
                    player1Team.teamComposition[4]!.characterHealth += player1Team.teamComposition[4]!.talent
                }
            case "5":
                if player1Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam1()
                } else {
                    print("=============================================================")
                    print("Your Rogue gain 1 lifepoint")
                    print("=============================================================")
                    player1Team.teamComposition[4]!.characterHealth += player1Team.teamComposition[4]!.talent
                }
            default:
                break
            }
            
        }
    }
    
    func heallingTeam2() {
        if let characterToHeal = readLine() {
            switch characterToHeal {
            case "1":
                if player2Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam2()
                } else {
                    print("=============================================================")
                    print("Your Warrior gain 1 lifepoint")
                    print("=============================================================")
                    player2Team.teamComposition[1]!.characterHealth += player2Team.teamComposition[4]!.talent
                }
            case "2":
                if player2Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam2()
                } else {
                    print("=============================================================")
                    print("Your Magus gain 1 lifepoint")
                    print("=============================================================")
                    player2Team.teamComposition[2]!.characterHealth += player2Team.teamComposition[4]!.talent
                }
            case "3":
                if player2Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam2()
                } else {
                    print("=============================================================")
                    print("Your Paladin gain 1 lifepoint")
                    print("=============================================================")
                    player2Team.teamComposition[3]!.characterHealth += player2Team.teamComposition[4]!.talent
                }
            case "4":
                if player2Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam2()
                } else {
                    print("=============================================================")
                    print("Your Druid gain 1 lifepoint")
                    print("=============================================================")
                    player2Team.teamComposition[4]!.characterHealth += player2Team.teamComposition[4]!.talent
                }
            case "5":
                if player2Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You can't choose this character because he isn't in your team or... maybe he's dead ?")
                    print("=============================================================")
                    heallingTeam2()
                } else {
                    print("=============================================================")
                    print("Your Rogue gain 1 lifepoint")
                    print("=============================================================")
                    player2Team.teamComposition[4]!.characterHealth += player2Team.teamComposition[4]!.talent
                }
            default:
                break
            }
            
        }
    }
}
