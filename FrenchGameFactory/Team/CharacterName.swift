//
//  CharacterName.swift
//  FrenchGameFactory
//
//  Created by Zidouni on 24/10/2022.
//

import Foundation

class ChooseCharacterName {
    var allCharactersName: [String] = [];
    static let checkName = ChooseCharacterName()
    
    func characterName() -> String {
        var name = ""
        repeat {
            print("Please choose a name for your character : ")
            if let nameData = readLine() {
                name = nameData
                if allCharactersName.contains(name) {
                    print("This name \(name) is already use, please choose an another")
                    characterName();
                } else {
                    allCharactersName.append(name)
                    print("Hmm \(name)... that's a good name !")
                }
            }
        } while name == ""
        return ""
    }
    
    
    
}
