//
//  CategoryItem.swift
//  learnDari
//
//  Created by Hosna Qasmei on 1/28/21.
//

import UIKit

struct CategoryItem: Codable {
    let category   : String
    let flashcards : [String]
    let images     : [String]
}
