//
//  DataLoader.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/23/21.
//

import Foundation

public class DataLoader {
    
    @Published var items: [RowItem] = []
    @Published var appData = [RowItem]()
    let rowSelected: String
    
    init(rowSelected: String) {
        self.rowSelected = rowSelected
        load(rowSelected: self.rowSelected)
        self.items = itemsArr()
    }
    
    func load(rowSelected: String){
        let jsonFileName = selectData(rowSelected: rowSelected)
        
        if let fileLocation = Bundle.main.url(forResource: jsonFileName, withExtension: K.extName){
            
            // do catch in case of error
            do{
                let data         = try Data(contentsOf: fileLocation)
                let jsonDecoder  = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([RowItem].self, from: data)
                self.appData     = dataFromJson
            }
            catch{
                print("Error")
            }
        }
    }
    
    func selectData(rowSelected: String) -> String{
        // TODO: Fix so there is a default handle case
        var temp = ""

        for (key, value) in K.sectionData{
           if key == rowSelected{
             temp = value
           }
        }
        return temp
    }
    

    func itemsArr() -> [RowItem]{
        let data = self.appData
        var cards: [RowItem] = []
        for i in 0..<data.count{
            cards.append(RowItem(dari: data[i].dari, english: data[i].english, image: data[i].image, sound: data[i].sound))
        }
        return data
    }
}
