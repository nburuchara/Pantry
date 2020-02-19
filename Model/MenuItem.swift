//
//  MenuItem.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/12/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import Foundation

class menuItem {
    var name: String
    var price: Double
    var section: String
    var category: String
    var category_2: String
    var category_3: String
    
    init (mName: String, mPrice:Double, mSection:String, mCategory: String, mCategory_2: String, mCategory_3: String) {
        name = mName
        price = mPrice
        section = mSection
        category = mCategory
        category_2 = mCategory_2
        category_3 = mCategory_3
    }
}
