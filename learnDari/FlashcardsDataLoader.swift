//
//  HomeDataLoader.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/28/21.
//

import Foundation

public class FlashcardsDataLoader {
    
    @Published var flashcardsData = [CategoryItem]()
    
    init() {
        load()
    }
    
    func load(){
        if let fileLocation = Bundle.main.url(forResource: K.flashcardsJsonFile, withExtension: K.extName){
            // do catch in case of error
            do{
                let data         = try Data(contentsOf: fileLocation)
                let jsonDecoder  = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([CategoryItem].self, from: data)
                self.flashcardsData     = dataFromJson
                
            }
            catch{
                print("Error")
            }
        }
    }
}
