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
    var turn: Int = 0
    
    init(attackerTeam1: Characters, attackerTeam2: Characters, attackedTeam1: Characters, attackedTeam2: Characters) {
        self.attackerTeam1 = attackerTeam1
        self.attackerTeam2 = attackerTeam2
        self.attackedTeam1 = attackedTeam1
        self.attackedTeam2 = attackedTeam2
    }
    
    func startingMenu() {
        print("Hello and welcome on the FrenchFactory company's game specially create for you.\n Let me tell you there rules : 📜 \n "
            + "\n1. You must form a team of 3 characters. You can't have 2 same characters in your Team. \n"
            + "\n2. Each character has a talent with 33% chance's activation. \n"
            + "\n3. You fight between fighters. The winner is the one who killed the opposing team's fighters. \n"
            + "\n4. The last rule and the more important, enjoy the game 😁. \n")
        print("=============================================================")
        player.player1Pseudo()
        player1Team.createYourTeam()
        player.player2Pseudo()
        player2Team.createYourTeam()
        team.displayPlayersTeams()
        
    }
    
    func fightingTeam1() {
        print("=============================================================")
        print("It's your turn \(player.playerPseudo[0]). Please choose your attacker")
        print("=============================================================")
        player1Team.statsTeam1()
        print("Choose a number associated with one of your team's characters")
        
        if let player1Attacker = readLine() {
            switch player1Attacker {
            case "1":
                if player1Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam1()
                } else {
                    print("=============================================================")
                    print("You choose your Warrior 🛡")
                    print("=============================================================")
                    attackerTeam1 = player1Team.teamComposition[1]!
                }
            case "2":
                if player1Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam1()
                } else {
                    print("=============================================================")
                    print("You choose your Magus 🧙‍♂️")
                    print("=============================================================")
                    attackerTeam1 = player1Team.teamComposition[2]!
                }
            case "3":
                if player1Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam1()
                } else {
                    print("=============================================================")
                    print("You choose your Paladin 🏇")
                    print("=============================================================")
                    attackerTeam1 = player1Team.teamComposition[3]!
                }
            case "4":
                if player1Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam1()
                } else {
                    print("=============================================================")
                    print("You choose your Druid 🦌")
                    print("=============================================================")
                    attackerTeam1 = player1Team.teamComposition[4]!
                }
            case "5":
                if player1Team.teamComposition[5] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam1()
                } else {
                    print("=============================================================")
                    print("You choose your Rogue 🗡")
                    print("=============================================================")
                    attackerTeam1 = player1Team.teamComposition[5]!
                }
            default:
                break
            }
            
            print("Which opponent character's would you like to attack ? ")
            player2Team.statsTeam2()
            print("=============================================================")
            print("Choose a number associate with one of your opponent team's")
            
            if let player2Attacked = readLine() {
                switch player2Attacked {
                case "1" :
                    if player2Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Warrior's 🛡")
                        print("=============================================================")
                        attackedTeam2 = player2Team.teamComposition[1]!
                        attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                        if attackedTeam2.characterHealth <= 0 {
                            player2Team.teamComposition.removeValue(forKey: 1)
                            checkWinnerTeam2()
                        }
                    }
                    
                case "2" :
                    if player2Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Magus's 🧙‍♂️")
                        print("=============================================================")
                        attackedTeam2 = player2Team.teamComposition[2]!
                        attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                        if attackedTeam2.characterHealth <= 0 {
                            player2Team.teamComposition.removeValue(forKey: 2)
                            checkWinnerTeam2()
                        }
                    }
                case "3" :
                    if player2Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Paladin's 🏇")
                        print("=============================================================")
                        attackedTeam2 = player2Team.teamComposition[3]!
                        attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                        if attackedTeam2.characterHealth <= 0  {
                            player2Team.teamComposition.removeValue(forKey: 3)
                            checkWinnerTeam2()
                        }
                    }
                case "4" :
                    if player2Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Druid's 🦌")
                        print("=============================================================")
                        attackedTeam2 = player2Team.teamComposition[4]!
                        attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                        if attackedTeam2.characterHealth <= 0 {
                            player2Team.teamComposition.removeValue(forKey: 4)
                            checkWinnerTeam2()
                        }
                    }
                case "5" :
                    if player2Team.teamComposition[5] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Rogue's 🗡")
                        print("=============================================================")
                        attackedTeam2 = player2Team.teamComposition[5]!
                        attackerTeam1.attackTeam2(attackedTeam2: attackedTeam2, attackerTeam1: attackerTeam1)
                        if attackedTeam2.characterHealth <= 0  {
                            player2Team.teamComposition.removeValue(forKey: 5)
                            checkWinnerTeam2()
                        }
                    }
                default:
                    break
                    
                }
            }
            player2Team.statsTeam2()
        }
    }
    
    func fightingTeam2() {
        print("=============================================================")
        print("It's your turn \(player.playerPseudo[1]). Please choose your attacker")
        print("=============================================================")
        player2Team.statsTeam2()
        print("=============================================================")
        print("Choose a number associated with one of your team's characters")
        
        if let player2Attacker = readLine() {
            switch player2Attacker {
            case "1":
                if player2Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam2()
                } else {
                    print("=============================================================")
                    print("You choose your Warrior 🛡")
                    print("=============================================================")
                    attackerTeam2 = player2Team.teamComposition[1]!
                }
            case "2":
                if player2Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam2()
                } else {
                    print("=============================================================")
                    print("You choose your Magus 🧙‍♂️")
                    print("=============================================================")
                    attackerTeam2 = player2Team.teamComposition[2]!
                }
            case "3":
                if player2Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam2()
                } else {
                    print("=============================================================")
                    print("You choose your Paladin 🏇")
                    print("=============================================================")
                    attackerTeam2 = player2Team.teamComposition[3]!
                }
            case "4":
                if player2Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam2()
                } else {
                    print("=============================================================")
                    print("You choose your Druid 🦌")
                    print("=============================================================")
                    attackerTeam2 = player2Team.teamComposition[4]!
                }
            case "5":
                if player2Team.teamComposition[5] == nil {
                    print("=============================================================")
                    print("You couldn't choose this character because he isn't in your team or... maybe he is dead ?")
                    print("=============================================================")
                    fightingTeam2()
                } else {
                    print("=============================================================")
                    print("You choose your Rogue 🗡")
                    print("=============================================================")
                    attackerTeam2 = player2Team.teamComposition[5]!
                }
            default:
                break
            }
            
            print("Which opponent character's would you like to attack ? ")
            player1Team.statsTeam1()
            print("=============================================================")
            print("Choose a number associate with one of your opponent team's")
            
            if let player1Attacked = readLine() {
                switch player1Attacked {
                case "1" :
                    if player2Team.teamComposition[1] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Warrior's 🛡")
                        print("=============================================================")
                        attackedTeam1 = player1Team.teamComposition[1]!
                        attackerTeam2.attackTeam1(attackedTeam1: attackedTeam1, attackerTeam2: attackerTeam2)
                        if attackedTeam1.characterHealth <= 0 {
                            player1Team.teamComposition.removeValue(forKey: 1)
                            checkWinnerTeam1()
                        }
                    }
                case "2" :
                    if player2Team.teamComposition[2] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Magus's 🧙‍♂️")
                        print("=============================================================")
                        attackedTeam1 = player1Team.teamComposition[2]!
                        attackerTeam2.attackTeam1(attackedTeam1: attackedTeam1, attackerTeam2: attackerTeam2)
                        if attackedTeam1.characterHealth <= 0 {
                            player1Team.teamComposition.removeValue(forKey: 2)
                            checkWinnerTeam1()
                        }
                    }
                case "3" :
                    if player2Team.teamComposition[3] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Paladin's 🏇")
                        print("=============================================================")
                        attackedTeam1 = player1Team.teamComposition[3]!
                        attackerTeam2.attackTeam1(attackedTeam1: attackedTeam1, attackerTeam2: attackerTeam2)
                        if attackedTeam1.characterHealth <= 0  {
                            player1Team.teamComposition.removeValue(forKey: 3)
                            checkWinnerTeam1()
                        }
                    }
                case "4" :
                    if player2Team.teamComposition[4] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Druid's 🦌")
                        print("=============================================================")
                        attackedTeam1 = player1Team.teamComposition[4]!
                        attackerTeam2.attackTeam1(attackedTeam1: attackedTeam1, attackerTeam2: attackerTeam2)
                        if attackedTeam1.characterHealth <= 0 {
                            player1Team.teamComposition.removeValue(forKey: 4)
                            checkWinnerTeam1()
                        }
                    }
                case "5" :
                    if player2Team.teamComposition[5] == nil {
                    print("=============================================================")
                    print("Your opponent hasn't got this character or... maybe he is dead ?")
                    print("=============================================================")
                    } else {
                        print("=============================================================")
                        print("You choose your opponent Rogue's 🗡")
                        print("=============================================================")
                        attackedTeam1 = player1Team.teamComposition[5]!
                        attackerTeam2.attackTeam1(attackedTeam1: attackedTeam1, attackerTeam2: attackerTeam2)
                        if attackedTeam1.characterHealth <= 0  {
                            player1Team.teamComposition.removeValue(forKey: 5)
                            checkWinnerTeam1()
                        }
                    }
                default:
                    break
                    
                }
            }
            player1Team.statsTeam1()
        }
    }
    
    func checkWinnerTeam1() {
        if player1Team.teamComposition.isEmpty {
            print("***************** The Winner is \(player.playerPseudo[1]) *****************")
            print("=============================== GAME OVER ===============================")
            player1Team.teamComposition.removeAll()
            player2Team.teamComposition.removeAll()
            print("If you want to play a new game please enter : 1")
            print("If you want to quit this game game please enter : 2")
            if let startNewGame = readLine() {
                switch startNewGame {
                case "1":
                    print("Let's start a new game !")
                    game.startingMenu()
                case "2":
                    print("I hope you enjoyed this game. See you soon !")
                    break
                default:
                    break
                }
            }
        }
    }
    
    func checkWinnerTeam2() {
        if player2Team.teamComposition.isEmpty {
            print("*****************The Winner is \(player.playerPseudo[0])*****************")
            print("=============================== GAME OVER ===============================")
            player1Team.teamComposition.removeAll()
            player2Team.teamComposition.removeAll()
            print("If you want play an other game please enter : 1")
            print("If you want quit this game game please enter : 2")
            if let startNewGame = readLine() {
                switch startNewGame {
                case "1":
                    print("Let's start a new game !")
                    game.startingMenu()
                case "2":
                    print("I hope you enjoyed this game. See you soon !")
                default:
                    break
                }
            }
        }
    }
}

var game = Game(attackerTeam1: magus, attackerTeam2: magus, attackedTeam1: magus, attackedTeam2: magus)
