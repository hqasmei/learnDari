//
//  DataLoader.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/23/21.
//

import Foundation

public class DataLoader {
    
    @Published var appData = [AppData]()
    
    let jsonFileName: String
    
    init(jsonFileName: String) {
        self.jsonFileName = jsonFileName
        load(jsonFileName: self.jsonFileName)
//        sort()
    }
    
    func load(jsonFileName: String){
        
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
    
//    func sort(){
//        self.userData = self.appData.sorted(by: <#T##(AppData, AppData) throws -> Bool#>)
//    }
//
    
}
