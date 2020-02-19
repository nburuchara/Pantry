//
//  CommunityPantryVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/3/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import Firebase

class CommunityPantryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var usersCollectionRef: CollectionReference! 

    var totalApprovedOrders = [String]()
    
    @IBOutlet weak var commPantryView: UITableView!
    
    var approvedItemNames = [String]()
    var approvedItemDescrips = [String]()
    var approvedItemPrices = [String]()
    var approvedItemOrderCodes = [String]()
    var allPantryAdds  = [PantryAdd]()
    var approvedPantryAdds = [PantryAdd]()
    var updatedApprovedPantryAdds = [PantryAdd]()
    var updatedApprovedPantryIds = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionRef = Firestore.firestore().collection("ApprovedOrders")
        usersCollectionRef.order(by: "name")
        
        getTotalOrders { (approvedOrders) in
            self.totalApprovedOrders.append(approvedOrders)
            DispatchQueue.main.async {
                self.commPantryView.reloadData()
            }
        }
        

        loadInformation { (allOrders) in
            for i in allOrders {
                //print(i.documentId)
                //self.updatedApprovedPantryIds.append(i.documentId)
                //self.updatedApprovedPantryIds = self.updatedApprovedPantryIds.sorted (by:{$0 < $1})
//                for i in self.updatedApprovedPantryIds {
//                    print(i)
//                }
                self.allPantryAdds.append(i)
            }
            self.getApprovedOrders { (approvedOrders) in
                for i in approvedOrders {
                    for j in self.allPantryAdds {
                        if i.documentId == j.documentId {
                            self.updatedApprovedPantryAdds.append(j)
                            self.updatedApprovedPantryAdds = self.updatedApprovedPantryAdds.removingDuplicates()
                            self.updatedApprovedPantryAdds = self.updatedApprovedPantryAdds.sorted { (this: PantryAdd, that: PantryAdd) -> Bool in
                                return this.documentId < that.documentId
                            }
                            self.commPantryView.reloadData()
                        }
                    }
                }
            }
        }
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
//        updatedApprovedPantryAdds.sort { (this: PantryAdd, that:PantryAdd) -> Bool in
//            return this.documentId < that.documentId
//        }
        //updatedApprovedPantryIds = updatedApprovedPantryIds.sorted (by:{$0 < $1})
        updatedApprovedPantryIds.removingDuplicates()
        for i in updatedApprovedPantryIds {
            print(i)
        }

    }
    
    func getTotalOrders (completion: @escaping (_ approvedOrders: String) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                for snap in (snapshot?.documents)! {
                    completion(snap.documentID)
                }
            }
        }
    }
    
    func getUpdatedItemNames (completion: @escaping (_ approvedNames: [String]) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    var nameArray = [String]()
                    nameArray.append(data["name"] as? String ?? "No name")
                    completion(nameArray)
                }
            }
        }
    }
    
    func getUpdatedItemDescrips (completion: @escaping (_ approvedDescrips: [String]) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    var descripArray = [String]()
                    descripArray.append(data["description"] as? String ?? "No descrip")
                    completion(descripArray)
                }
            }
        }
    }
    
    func getUpdatedItemPrices (completion: @escaping (_ approvedPrices: [String]) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    var priceArray = [String]()
                    priceArray.append(data["price"] as? String ?? "No price")
                    completion(priceArray)
                }
            }
        }
    }
    
    
    
    func getOrderCode (completion: @escaping (_ orderCode: String) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    let orderCode = data["documentId"] as? String ?? "No order ID"
                    completion(orderCode)
                }
            }
        }
    }
    
    
    func retrieveOrderInformation (completion: @escaping (_ nameArray: [String], _ descriptArray: [String], _ priceArray: [String], _ orderCode: [String]) ->()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    var nameArray = [String]()
                    var descriptArray = [String]()
                    var priceArray = [String]()
                    var codeArray = [String]()
                    codeArray.append(data["documentId"] as? String ?? "No order ID")
                    nameArray.append(data["name"] as? String ?? "No name")
                    descriptArray.append(data["description"] as? String ?? "No description")
                    priceArray.append(data["price"] as? String ?? "No price")
                    completion(nameArray, descriptArray, priceArray, codeArray)
                }
            }
        }
    }
    
    func loadInformation (completion: @escaping (_ allOrders : [PantryAdd])->()) {
        let db = Firestore.firestore()
        db.collection("PantryOrders").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    //print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")")
                    //let theUserEmail = document.documentID
                    let data = document.data()
                    let pName = data["name"] as? String ?? "no name"
                    let descript = data["description"] as? String ?? "no description"
                    let datePurch = data["datePurchased"] as? String ?? "no date purchased"
                    let dateSellBy = data["dateSellBy"] as? String ?? "no date sell by"
                    let price = data["price"] as? String ?? "no price"
                    let userAddress = data["address"] as? String ?? "no address"
                    let pdocID = document.documentID
                    let userEmail = data["email"] as? String ?? "no email"
                    let newPantryAdd = PantryAdd(iName: pName, iDescription: descript, iDateP: datePurch, iDSellb: dateSellBy, iPrice: price, uAddress: userAddress, docID: pdocID, uEmail: userEmail)
                    //self.allPantryAdds.append(newPantryAdd)
                    var insidePantryAdds = [PantryAdd]()
                    insidePantryAdds.append(newPantryAdd)
                    completion(insidePantryAdds)
                }
            }
        }
    }
    
    func getApprovedOrders (completion: @escaping (_ approvedOrders: [PantryAdd])->()) {
        let db = Firestore.firestore()
        db.collection("ApprovedOrders").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    //print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")")
                    //let theUserEmail = document.documentID
                    let data = document.data()
                    let pName = data["name"] as? String ?? "no name"
                    let descript = data["description"] as? String ?? "no description"
                    let datePurch = data["datePurchased"] as? String ?? "no date purchased"
                    let dateSellBy = data["dateSellBy"] as? String ?? "no date sell by"
                    let price = data["price"] as? String ?? "no price"
                    let userAddress = data["address"] as? String ?? "no address"
                    let pdocID = data["documentId"] as? String ?? "no document id"
                    let userEmail = data["email"] as? String ?? "no email"
                    let newPantryAdd = PantryAdd(iName: pName, iDescription: descript, iDateP: datePurch, iDSellb: dateSellBy, iPrice: price, uAddress: userAddress, docID: pdocID, uEmail: userEmail)
                    //self.approvedPantryAdds.append(newPantryAdd)
                    var insidePantryAdds = [PantryAdd]()
                    insidePantryAdds.append(newPantryAdd)
                    completion(insidePantryAdds)
                }
            }
        }
    }
    
    func deleteSoldItems () {
        for i in approvedPantryAdds {
            print("approved: \(i)")
        }
        
        for i in allPantryAdds {
            print("all: \(i)")
        }
    }

    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatedApprovedPantryAdds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let pantryAddition = updatedApprovedPantryAdds[indexPath.row]
        for i in updatedApprovedPantryAdds {
            updatedApprovedPantryIds.append(i.documentId)
        }
        cell.textLabel?.text = pantryAddition.name
        cell.detailTextLabel?.text = "Details: \(pantryAddition.descript)                Price: $\(pantryAddition.price)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "orderInfo", sender: self)
        //print(updatedApprovedPantryIds[(commPantryView.indexPathForSelectedRow?.row)!])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "orderInfo" {
            let nextVC = segue.destination as! OrderInfoVC
            
            nextVC.receivedOrderCode = updatedApprovedPantryIds[(commPantryView.indexPathForSelectedRow?.row)!] 
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    
    func updateCommunityPantryList () {
        retrieveOrderInformation { (newNames, newDescrips, newPrices, newOrder) in
            self.approvedItemNames = newNames
            self.approvedItemDescrips = newDescrips
            self.approvedItemPrices  = newPrices
            DispatchQueue.main.async {
                self.commPantryView.reloadData()
            }
        }
    }
}
    extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

