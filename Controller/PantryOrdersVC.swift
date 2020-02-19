//
//  PantryOrdersVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/4/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import Firebase 

class PantryOrdersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var usersCollectionRef: CollectionReference!
    var usersCollectionRef2: CollectionReference!
    
    var userEmail : String? = nil
    
    @IBOutlet weak var orderListView: UITableView!
    
    var totalOrderRequests = [String]()
    var allInterestOrders = [String]()
    var userSpecificInterestOrders = [String]()
    var allInterestGivers = [String]()
    var allInterestItemOrderCodes = [String]()
    var orderPantryAdds = [PantryAdd]()
    
    
    var outUserOrderCodes : [String] = []
    var outApprovedOrderCodes : [String] = []
    
    var commonArrays : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersCollectionRef = Firestore.firestore().collection("userOrders")
        usersCollectionRef2 = Firestore.firestore().collection("ApprovedOrders")
        userEmail = UserDefaults.standard.string(forKey: "userEmail")
        //userEmail = "No email found"
        
            // print all documents from ApprovedOrders
//        getTotalOrders { (approvedOrderCodes) in
//            self.outApprovedOrderCodes.append(approvedOrderCodes)
//        }
        
        getTotalOrders { (userOrders) in
            self.totalOrderRequests.append(userOrders)
            DispatchQueue.main.async {
                self.orderListView.reloadData()
            }
        }
        
        retrieveEmailInformation(userEmail!) { (orders, emails) in
            for i in orders {
                self.allInterestOrders.append(i)
                print(i)
            }
            
            for i in emails {
                self.allInterestGivers.append(i)
            }
            
            for i in self.allInterestGivers {
                print(i)
            }
        }
        
        loadInformation(uEmail: userEmail!) { (orders) in
            for i in orders {
//                print ("user emails: \(i.userAddress)")
//                print("user order item name: \(i.name)")
                self.orderPantryAdds.append(i)
            }
        }
        

        
        // Iterate through the orderCodes in the userOrders and see if it matches and orderCode int "getTotalOrders"
        retrieveOrderCodeInformation { (userOrderCodes) in
            self.getTotalOrders { (approvedOrderCodes) in
                self.outApprovedOrderCodes.append(approvedOrderCodes)
                self.outUserOrderCodes.append(userOrderCodes)
                let firstArray = self.outUserOrderCodes
                let secondArray = self.outApprovedOrderCodes
                
//                print(self.outUserOrderCodes)
//                print(self.outApprovedOrderCodes)
                let newArray  = firstArray.filter { (string) -> Bool in
                    return secondArray.contains(string)
                }

            }
            
        }
        
        // Then get that orderCode and print all of it's data and save them in arrays to eb return via a completion hanlder.
        
        

//        getRelevantUserOrder { (orderCodes, names, emails) in
//
//            self.getTotalRelevantUserOrders(self.userEmail!, self.allInterestOrders) { (emptyString) in
//                //
//            }
////            self.allInterestOrders.append(names)
////            print(self.allInterestOrders)
////            print("ORDER CODE(S): \(orderCodes)")
////            print("NAME(S): \(names)")
////            print("EMAIL(S): \(emails)")
////            for i in names {
////                self.allInterestOrders.append(i)
////            }
////
////            for i in emails {
////                self.interestGiver.append(i)
////            }
////
////            for i in orderCodes {
////                self.allInterestItemOrderCodes.append(i)
////            }
////
//            //print(self.allInterestItemOrderCodes)
//            for i in self.allInterestGivers {
//                if self.userEmail == i {
//                    self.getTotalRelevantUserOrders(self.userEmail!, self.allInterestItemOrderCodes) { (correctOCode) in
//                        //print(correctOCode)
//                    }
//                }
//            }
//        }
        
        
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
    
    func retrieveEmailInformation (_ uEmail: String,completion: @escaping (_ orders: [String], _ emails: [String])-> ()) {
        let db = Firestore.firestore()
        db.collection("userOrders").whereField("email", isEqualTo: uEmail).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    //print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")")
                    //let theUserEmail = document.documentID
                    var selectOrderName = [String]()
                    var selectOrderEmail = [String]()
                    selectOrderName.append(document.data()["name"] as? String ?? "no name")
                    selectOrderEmail.append(document.data()["fromEmail"] as? String ?? "no email")
                    completion(selectOrderName, selectOrderEmail)
                }
            }
        }
    }
    
    func loadInformation (uEmail: String,completion: @escaping (_ allOrders : [PantryAdd])->()) {
        let db = Firestore.firestore()
        db.collection("userOrders").whereField("email", isEqualTo: uEmail).getDocuments { (snapshot, error) in
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
                    let fromEmail = data["fromEmail"] as? String ?? "no address"
                    let pdocID = document.documentID
                    let userEmail = data["email"] as? String ?? "no email"
                    let newPantryAdd = PantryAdd(iName: pName, iDescription: descript, iDateP: datePurch, iDSellb: dateSellBy, iPrice: price, uAddress: fromEmail, docID: pdocID, uEmail: userEmail)
                    //self.allPantryAdds.append(newPantryAdd)
                    var insidePantryAdds = [PantryAdd]()
                    insidePantryAdds.append(newPantryAdd)
                    completion(insidePantryAdds)
                }
            }
        }
    }
    
    
    func retrieveOrderCodeInformation (completion: @escaping (_ name: String) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                debugPrint("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    let name = data["orderCode"] as? String ?? "No order code"
                    completion(name)
                }
            }
        }
    }
    
    
    func getTotalRelevantUserOrders (_ uEmail: String,_ orderCodes :[String], completion: @escaping (_ correctOrderCode: String)->()) {
        let db = Firestore.firestore()
        db.collection("userOrders").whereField("orderCode", isEqualTo: uEmail).getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents", error)
            } else {
                for document in snapshot!.documents {
                    print("ORDER ID: \(document.documentID) & ORDER NAMES: \(document.data()["email"] as? String ?? "no email")")
                    let just4You : String = ""
                            completion(just4You)
                }
            }
        }
    }
    
    func getRelevantUserOrder (completion: @escaping (_ orderCode: String,_ nameArray: String, _ emailArray: String) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Caught error with error: ", error)
            } else {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let data = document.data()
                    var nameArray : String = ""
                    var emailArray : String = ""
                    var orderCodes : String = ""
                    orderCodes = data["orderCode"] as? String ?? "No order code"
                    nameArray = data["name"] as? String ?? "No name"
                    emailArray = data["fromEmail"] as? String ?? "No email"
                    completion(orderCodes,nameArray, emailArray)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contactBuyer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactBuyer" {
            let nextVC = segue.destination as! NotifyBuyerVC
            nextVC.receivedEmail = allInterestGivers[(orderListView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderPantryAdds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        let pantryAdds = orderPantryAdds[indexPath.row]
        cell.textLabel?.text = "New Order for: \(pantryAdds.name)"
        cell.detailTextLabel?.text = "From: \(pantryAdds.email!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let pantryItem = orderPantryAdds[indexPath.row]
            let db = Firestore.firestore()
            db.collection("userOrders").document(pantryItem.documentId).delete { (error) in
                if let error = error {
                    debugPrint("Could not delete item: \(error.localizedDescription)")
                }
            }
            orderPantryAdds.remove(at: indexPath.row)
            DispatchQueue.main.async {
                self.orderListView.reloadData()
            }
            
        }
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

