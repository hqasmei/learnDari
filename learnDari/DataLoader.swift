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
        
        if let fileLocation = Bundle.main.url(forResource: jsonFileName, withExtension: K.extName){
            
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
            case K.home:
                return K.homeJsonFile
            case K.alphabet:
                return K.alphabetJsonFile
            case K.numbers:
                return K.numbersJsonFile
            case K.greetings:
                return K.greetingsJsonFile
            case K.pronouns:
                return K.pronounsJsonFile
            case K.days:
                return K.daysJsonFile
            
            default:
                return K.homeJsonFile
        }
    }

}
