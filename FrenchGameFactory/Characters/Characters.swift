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
                print("Oh, with his shield, your opponent reduce his damage by \(characterHealth - oldValue)")
                print("=============================================================")
                
            } else if oldValue < characterHealth && className == "Druid" {
                print("Oh ! With his talent your Druid heal one of your characters, his lifepoints increase by 1 ")
                print("=============================================================")
            }
            
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
}
