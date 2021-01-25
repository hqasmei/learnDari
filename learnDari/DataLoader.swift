//
//  DataLoader.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/23/21.
//

import Foundation

public class DataLoader {
    
    @Published var appData = [AppData]()
    let rowSelected: String
    
    init(rowSelected: String) {
        self.rowSelected = rowSelected
        load(rowSelected: self.rowSelected)
    }
    
    func load(rowSelected: String){
        let jsonFileName = selectData(rowSelected: rowSelected)
        
        if let fileLocation = Bundle.main.url(forResource: jsonFileName, withExtension: "json"){
            
            // do catch in case of error
            do{
                let data         = try Data(contentsOf: fileLocation)
                let jsonDecoder  = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([AppData].self, from: data)
                self.appData     = dataFromJson
            }
            catch{
                print("Error")
            }
        }
    }
    
    func selectData(rowSelected: String) -> String{
        switch rowSelected {
        case "Alphabet":
            return K.alphabetJsonFile
        case "Numbers":
            return K.numbersJsonFile
        case "Greetings":
            return K.greetingsJsonFile
        case "Pronouns":
            return K.pronounsJsonFile
        case "Days":
            return K.daysJsonFile
        case "Home":
            return K.homeJsonFile
        default:
            return K.homeJsonFile
        }
    }

}
