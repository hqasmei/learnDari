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
    // Flashcards
    static let flashcards                         = "Flashcards"
    static let flashcardsJsonFile                 = "flashcardsData"
    static let flashcardsToViewSegue              = "FlashcardsToView"
    
    static let categoriesTableViewIdentifier      = "CategoriesTableViewCell"
    static let categoriesCellIdentifier           = "CategoriesCell"
    
    static let flashcardsCollectionViewIdentifier = "FlashcardsCollectionViewCell"
    static let flashcardsCellIdentifier           = "FlashcardsCell"
    
    static let vocabularyToSubDataSegue           = "VocabularyToSubData"
    
    // ======================================================================
    // Sections
    static let sectionData: [String:String] = [ "Greetings"   :"greetingsData",
                                                "Age"         :"ageData",
                                                "Occupations" :"occupationsData",
                                                "Pronouns"    :"pronounsData",
                                                "Nouns"       :"nounsData",
                                                "Verbs"       :"verbsData",
                                                "Telling Time":"tellingtimeData",
                                                "Days"        :"daysData",
                                                "Months"      :"monthsData",
                                                "Alphabet"    :"alphabetData",
                                                "Numbers"     :"numbersData"
                                                ]
    
}
