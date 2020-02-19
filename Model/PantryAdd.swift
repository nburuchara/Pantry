//
//  PantryAdd.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/5/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import Foundation

class PantryAdd: Hashable {
    static func == (lhs: PantryAdd, rhs: PantryAdd) -> Bool {
        return lhs.name == rhs.name && lhs.descript == rhs.descript && lhs.datePurchased == rhs.datePurchased && lhs.dateSellBy == rhs.dateSellBy && lhs.price == rhs.price && lhs.userAddress == rhs.userAddress && lhs.email == rhs.email
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(descript)
        hasher.combine(datePurchased)
        hasher.combine(dateSellBy)
        hasher.combine(price)
        hasher.combine(userAddress)
        hasher.combine(email)
    }

    var name: String
    var descript: String
    var datePurchased: String
    var dateSellBy: String
    var price: String
    var userAddress: String
    var documentId : String
    var email : String?

    
    init (iName: String, iDescription: String, iDateP: String, iDSellb: String, iPrice: String, uAddress: String, docID: String, uEmail: String?) {
        self.name = iName
        self.descript = iDescription
        self.datePurchased = iDateP
        self.dateSellBy = iDSellb
        self.price = iPrice
        self.userAddress = uAddress
        self.documentId = docID
        self.email = uEmail ?? "no email"
    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(name, forKey: "itemName")
//        coder.encode(descript, forKey: "itemDescription")
//        coder.encode(datePurchased, forKey: "itemDateP")
//        coder.encode(dateSellBy, forKey: "itemDateSB")
//        coder.encode(price, forKey: "itemPrice")
//        coder.encode(userAddress, forKey: "userAddress")
//    }
//
//    required convenience init?(coder iCoder: NSCoder) {
//        let name = iCoder.decodeObject(forKey: "itemName") as! String
//        let descript = iCoder.decodeObject(forKey: "itemDescription") as! String
//        let datePurchased = iCoder.decodeObject(forKey: "itemDateP") as! String
//        let dateSellBy = iCoder.decodeObject(forKey: "itemDateSB") as! String
//        let price = iCoder.decodeObject(forKey: "itemPrice") as! String
//        let userAddress = iCoder.decodeObject(forKey: "userAddress") as! String
//        self.init(iName: name, iDescription: descript, iDateP: datePurchased, iDSellb: dateSellBy, iPrice: price, uAddress: userAddress)
//    }
}
