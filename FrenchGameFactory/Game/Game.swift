//
//  Game.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 25/10/2022.
//

import Foundation
class Game {
    
    var attackerTeam1: Characters
    var attackerTeam2: Characters
    var attackedTeam1: Characters
    var attackedTeam2: Characters
    
    init(attackerTeam1: Characters, attackerTeam2: Characters, attackedTeam1: Characters, attackedTeam2: Characters) {
        self.attackerTeam1 = attackerTeam1
        self.attackerTeam2 = attackerTeam2
        self.attackedTeam1 = attackedTeam1
        self.attackedTeam2 = attackedTeam2
    }
    
    func startingMenu() {
        print("Hello and welcome on the FrenchFactory company's game specially create for you.\n Let me tell you there rules : 📜 \n "
            + "\n1. You must form a team of 3 characters. You can't have 2 same characters in your Team. \n"
            + "\n2. Each character has a talent with 50% chance's activation. \n"
            + "\n3. You fight between fighters. The winner is the one who killed the opposing team's fighters. \n"
            + "\n4. The last rule and the more important, enjoy the game 😁. \n")
        print("------------------------------------------------------")
        player.player1Pseudo()
        player1Team.createYourTeam()
        player.player2Pseudo()
        player2Team.createYourTeam()
        team.displayPlayersTeams()
        
    }
    
    func fightingTeam1() {
        print("Please choose your attacker")
        player1Team.statsTeam1()
        print("Choose a number associated with one of your team's characters")
        
        if let player1Attacker = readLine() {
            switch player1Attacker {
            case "1":
                if player1Team.teamComposition[1] == nil {
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    fightingTeam1()
                } else {
                    print("You choose your Warrior 🛡")
                    attackerTeam1 = player1Team.teamComposition[1]!
                }
            case "2":
                if player1Team.teamComposition[2] == nil {
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    fightingTeam1()
                } else {
                    print("You choose your Magus 🧙‍♂️")
                    attackerTeam1 = player1Team.teamComposition[2]!
                }
            case "3":
                if player1Team.teamComposition[3] == nil {
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    fightingTeam1()
                } else {
                    print("You choose your Paladin 🏇")
                    attackerTeam1 = player1Team.teamComposition[3]!
                }
            case "4":
                if player1Team.teamComposition[4] == nil {
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    fightingTeam1()
                } else {
                    print("You choose your Druid 🦌")
                    attackerTeam1 = player1Team.teamComposition[4]!
                }
            case "5":
                if player1Team.teamComposition[5] == nil {
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    fightingTeam1()
                } else {
                    print("You choose your Rogue 🗡")
                    attackerTeam1 = player1Team.teamComposition[5]!
                }
            default:
                break
            }
            
            print("Which opponent character's would you like to attack ? ")
            player2Team.statsTeam2()
            print("Choose a number associate with one of your opponent team's")
            
            if let player2Attacked = readLine() {
                switch player2Attacked {
                case "1" :
                    print("You choose your opponent Warrior's 🛡")
                    attackedTeam2 = player2Team.teamComposition[1]!
                    attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                case "2" :
                    print("You choose your opponent Magus's 🧙‍♂️")
                    attackedTeam2 = player2Team.teamComposition[2]!
                    attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                case "3" :
                    print("You choose your opponent Paladin's 🏇")
                    attackedTeam2 = player2Team.teamComposition[3]!
                    attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                case "4" :
                    print("You choose your opponent Druid's 🦌")
                    attackedTeam2 = player2Team.teamComposition[4]!
                    attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                case "5" :
                    print("You choose your opponent Rogue's 🗡")
                    attackedTeam2 = player2Team.teamComposition[5]!
                    attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                default:
                    break
                    
                }
                
            }
            player2Team.statsTeam2()
            
        }
    }
    
}

var game = Game(attackerTeam1: magus, attackerTeam2: magus, attackedTeam1: magus, attackedTeam2: magus )
