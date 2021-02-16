//
//  Constants.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/18/21.
//

struct K {
    
    static let appName        = "learnDari"
    static let extName        = "json"
    // ======================================================================
    // Cell
    static let cellTableViewIdentifier = "ReusableTableViewCell"
    static let cellIdentifier          = "ReusableCell"
   
    static let dataTableViewIdentifier = "DataTableViewCell"
    static let dataCellIdentifier      = "DataCell"
    
    // ======================================================================
    // Learn
    static let learn                            = "Learn"
    static let learnTableViewIdentifier         = "LearnTableViewCell"
    static let learnCellIdentifier              = "LearnCell"
    
    static let categoryCollectionViewIdentifier = "CategoryCollectionViewCell"
    static let categoryCellIdentifier           = "CategoryCell"
    
    static let learnJsonFile                 = "flashcardsData"
    static let learnToViewSegue              = "LearnToView"
//    static let learnCollectionViewIdentifier = "FlashcardsCollectionViewCell"
//    static let learnCellIdentifier           = "FlashcardsCell"
    
   
    
    
    static let vocabularyToSubDataSegue           = "VocabularyToSubData"
    
    
    
    // ======================================================================
    // Dictionary
    static let dictionary                   = "Dictionary"
    
    // ======================================================================
    // Info
    static let info                         = "Info"
    
    
    
    // ======================================================================
    // Sections
    static let sectionData: [String:String] = [
        "Alphabet"             : "alphabetData",
        "Numbers"              : "numbersData",
        "Essential Phrases 01" : "es01Data",
        "Essential Phrases 02" : "es02Data",
        "Verbs 01"             : "verbs01Data",
        "Verbs 02"             : "verbs02Data",
        "Fruits & Vegetables"  : "fandvData",
        "Animals"              : "animalsData",
        "Colors"               : "colorsData"
                                                ]

    
    
    
    
    // ======================================================================
    // Other
    static let proximaNovaRegular         = "ProximaNova-Regular"
    static let playfairDisplayRegularBold = "PlayfairDisplay-Regular_Bold"
    
}
