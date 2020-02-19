//
//  ListPantryVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/29/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import CoreData
import Firebase

//var totalPantryNames = [String]()
//var totalPantryDescriptions = [String]()
//var totalPantryDp = [String]()
//var totalPantrydSB = [String]()
//var totalPantryPrice = [String]()
//var totalPantryAddress = [String]()
//var receivedPantryAdds = [PantryAdd]()

class ListPantryVC: UIViewController, UITableViewDelegate, UITableViewDataSource, dataSentBackFast {
    

    func fieldsSentBack(docID: String, name: String, descript: String, price: String) {
        loadInformation(userEmail) { (pantryItems) in
            for i in pantryItems {
                self.allPantryAdds.append(i)
            }
            for i in pantryItems {
                self.pantryIds.append(i.documentId)
                if docID == i.documentId{
                    i.name = name
                    i.descript = descript
                    i.price = price
                }
            }
            for i in pantryItems {
                self.pantryNames.append(i.name)
            }
            for i in pantryItems {
                self.pantryDescriptions.append(i.descript)
            }
            for i in pantryItems {
                self.pantryDatePurchased.append(i.datePurchased)
            }
            for i in pantryItems {
                self.pantryDateSellBy.append(i.dateSellBy)
            }
            for i in pantryItems {
                self.pantryPrices.append(i.price)
            }
        }
        DispatchQueue.main.async {
            self.pantryTableView.reloadData()
        }
    }
    
    var usersCollectionRef: CollectionReference!
    
    //let pantryItems : PantryAdd = []
    
    @IBOutlet weak var pantryTableView: UITableView!
    var itemName : String = ""
    var itemDescription : String = ""
    var itemDatePurchased : String = ""
    var itemDateSellBy : String = ""
    var itemPrice : String = ""
    var itemAddress : String = ""
    
    var userEmail: String = ""
    
    var pantryIds = [String]()
    var pantryNames = [String]()
    var pantryDescriptions = [String]()
    var pantryDatePurchased = [String]()
    var pantryDateSellBy = [String]()
    var pantryPrices = [String]()
    
    
    var allPantryRequests = [String]()
    var listOrderNames = [String]()
    var listOrderDescriptions = [String]()
    var listOrderPrices = [String]()
    var allPantryAdds = [PantryAdd]()
    
    var pantryItems : [PantryAdd] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionRef = Firestore.firestore().collection("PantryOrders")
        
//        if let x = UserDefaults.standard.object(forKey: "updatedNames") as? [PantryAdd] {
//            receivedPantryAdds = x
//        }
        
        userEmail = UserDefaults.standard.string(forKey: "userEmail")!
//        if let x = UserDefaults.standard.object(forKey: "updatedDescriptions") as? [String] {
//            totalPantryDescriptions = x
//        }
//
//        if let x = UserDefaults.standard.object(forKey: "updatedDP") as? [String] {
//            totalPantryDp = x
//        }
//
//        if let x = UserDefaults.standard.object(forKey: "updatedDSB") as? [String] {
//            totalPantrydSB = x
//        }
//
//        if let x = UserDefaults.standard.object(forKey: "updatedPrice") as? [String] {
//            totalPantryPrice = x
//        }
//
//        if let x = UserDefaults.standard.object(forKey: "updatedAddress") as? [String] {
//            totalPantryAddress = x
//        }
        
//        let defaults = UserDefaults.standard
//
//        if let savedAdds = defaults.object(forKey: "pantryAdd") as? Data {
//            let jsonDecoder = JSONDecoder()
//            do {
//                receivedPantryAdds = try jsonDecoder.decode([PantryAdd].self, from: savedAdds)
//            } catch {
//                print("Failed to load")
//            }
//        }

//        for i in receivedPantryAdds {
//            print("Name: \(i.name), Description: \(i.descript), Date Purchased: \(i.datePurchased), Date Sell by: \(i.dateSellBy), Price: \(i.price), Address: \(i.userAddress) ")
//        }
//
//        getAllOrders(userEmail) { (orders) in
//            self.allPantryRequests.append(orders)
//            DispatchQueue.main.async {
//                self.pantryTableView.reloadData()
//            }
//        }
        
//        getTotalOrders { (orders) in
//            self.allPantryRequests.append(orders)
//            DispatchQueue.main.async {
//                self.pantryTableView.reloadData()
//            }
//        }
        
//        retrieveInformation(userEmail) { (myOrderNames, myOrderDescriptions, myOrderPrices) in
//            for i in myOrderNames {
//                self.listOrderNames.append(i)
//            }
//
//            for i in myOrderDescriptions {
//                self.listOrderDescriptions.append(i)
//            }
//
//            for i in myOrderPrices {
//                self.listOrderPrices.append(i)
//            }
//        }
        
        loadInformation(userEmail) { (pantryItems) in
            for i in pantryItems {
                self.allPantryAdds.append(i)
            }
            for i in pantryItems {
                self.pantryIds.append(i.documentId)
                
            }
            for i in pantryItems {
                self.pantryNames.append(i.name)
            }
            for i in pantryItems {
                self.pantryDescriptions.append(i.descript)
            }
            for i in pantryItems {
                self.pantryDatePurchased.append(i.datePurchased)
            }
            for i in pantryItems {
                self.pantryDateSellBy.append(i.dateSellBy)
            }
            for i in pantryItems {
                self.pantryPrices.append(i.price)
            }
        }
        

    }
    


    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func retrieveInformation (_ uEmail: String,completion: @escaping (_ orders: [String], _ descripts: [String], _ price: [String])-> ()) {
        let db = Firestore.firestore()
        db.collection("PantryOrders").whereField("email", isEqualTo: uEmail).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    //print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")")
                    //let theUserEmail = document.documentID
                    var selectOrderName = [String]()
                    var selectOrderDescripts = [String]()
                    var selectOrderPrices = [String]()
                    selectOrderName.append(document.data()["name"] as? String ?? "no name")
                    selectOrderDescripts.append(document.data()["description"] as? String ?? "no description")
                    selectOrderPrices.append(document.data()["price"] as? String ?? "no price")
                    completion(selectOrderName, selectOrderDescripts, selectOrderPrices)
                }
            }
        }
    }
    
    
    func loadInformation (_ uEmail: String, completion: @escaping (_ allPantryItems : [PantryAdd])->()) {
        let db = Firestore.firestore()
        db.collection("PantryOrders").whereField("email", isEqualTo: uEmail).addSnapshotListener { (snapshot, error) in
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
                    var insidePantryAdds = [PantryAdd]()
                    insidePantryAdds.append(newPantryAdd)
                    completion(insidePantryAdds)
                    //self.allPantryAdds.append(newPantryAdd)
//                    DispatchQueue.main.async {
//                        self.pantryTableView.reloadData()
//                    }
                }
            }
        }
    }
    
    func getTotalOrders (completion: @escaping (_ orders: String) -> ()) {
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
    
    func getAllOrders (_ uEmail: String,completion: @escaping (_ orders: String)-> ()) {
        let db = Firestore.firestore()
        db.collection("PantryOrders").whereField("email", isEqualTo: uEmail).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    completion(document.documentID)
                    //print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")"
                }
            }
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.pantryTableView.reloadData()
        }
    }
    
    
    func getPantryItemNames (item_passed: [SellerItem]) ->[String] {
        var saved_pantry_names : [String] = []
        for i in item_passed {
            saved_pantry_names.append(i.name ?? "No name here")
        }
        return saved_pantry_names
    }
    
    func getPantryItemDescriptions (item_passed: [SellerItem]) -> [String] {
        var saved_pantry_descrips : [String] = []
        for i in item_passed {
            saved_pantry_descrips.append(i.descrip ?? "No description here")
        }
        return saved_pantry_descrips
    }
    
    func getPantryItemPrices (item_passed: [SellerItem]) -> [String] {
        var saved_pantry_prices : [String] = []
        for i in item_passed {
            saved_pantry_prices.append(i.price ?? "No price was saved")
        }
        return saved_pantry_prices
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPantryAdds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pantryToEdit", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let pantryAddition = allPantryAdds[indexPath.row]
        cell.textLabel?.text = "\(pantryAddition.name)"
        cell.detailTextLabel?.text = "Details: \(pantryAddition.descript)        $\(pantryAddition.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pantryItem = allPantryAdds[indexPath.row]
            let db = Firestore.firestore()
            db.collection("PantryOrders").document(pantryItem.documentId).delete { (error) in
                if let error = error {
                    debugPrint("Could not delete item: \(error.localizedDescription)")
                }
            }
            allPantryAdds.remove(at: indexPath.row)
            DispatchQueue.main.async{
                self.pantryTableView.reloadData()
            }
            
        }
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantryToEdit" {
            let nextVC = segue.destination as! EditPantryItemVC
            nextVC.receivedDocID = pantryIds[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.receivedName = pantryNames[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.receivedDescription = pantryDescriptions[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.receivedDatePurchased = pantryDatePurchased[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.receivedSellByDate = pantryDateSellBy[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.receivedPrice = pantryPrices[(pantryTableView.indexPathForSelectedRow?.row)!]
            nextVC.delegate = self
        }
    }
    
    func removeItem (atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        //managedContext.delete(pantryItems[indexPath.row])

        do {
            try managedContext.save()
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
        }
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
