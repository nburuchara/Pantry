//
//  OrderInfoVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/6/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import Firebase

class OrderInfoVC: UIViewController {
    
    var usersCollectionRef: CollectionReference!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var datePurchasedLabel: UILabel!
    @IBOutlet weak var sellByDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    var receivedOrderCode  = ""
    
    
    @IBOutlet weak var interestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //emailLabel.text = userEmail
        usersCollectionRef = Firestore.firestore().collection("PantryOrders")
        var usrEmail = UserDefaults.standard.string(forKey: "userEmail") ?? "No email"
        
        getSelectedOrderInfo(receivedOrderCode) { (name, descript, dateP, dateSB, price, uEmail) in
            self.nameLabel.text = name
            self.descriptionLabel.text = descript
            self.datePurchasedLabel.text = dateP
            self.sellByDateLabel.text = dateSB
            self.priceLabel.text = "$\(price)"
            self.emailLabel.text = uEmail
//            self.loadInformation(self.receivedOrderCode) { (emails) in
//                print(emails)
//            }
        }
        print(receivedOrderCode)
        

        interestBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        interestBtn.layer.cornerRadius = (interestBtn.frame.height/2)
        interestBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    
//        loadInformation(receivedOrderCode) { (name, descript, datePurchased, sellByDate, price, email) in
//            self.nameLabel.text = name
//            self.descriptionLabel.text = descript
//            self.datePurchasedLabel.text = datePurchased
//            self.sellByDateLabel.text = sellByDate
//            self.priceLabel.text = "$\(price)"
//            self.emailLabel.text = email
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        loadInformation(receivedOrderCode) { (name, descript, datePurchased, sellByDate, price, email) in
//            self.nameLabel.text = name
//            self.descriptionLabel.text = descript
//            self.datePurchasedLabel.text = datePurchased
//            self.sellByDateLabel.text = sellByDate
//            self.priceLabel.text = "$\(price)"
//            self.emailLabel.text = email
//        }
//
    }

    
    func getSelectedOrderInfo (_ orderCode : String, completion: @escaping (_ name: String,_ descript:String,_ datePurchased: String,_ sellBY: String,_ price:String, _ email:String  ) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents \(error)")
            } else {
                for document in snapshot!.documents {
                    var orderCodes : [String] = []
                    orderCodes.append(document.documentID)
                    for i in orderCodes {
                        if i == orderCode {
                            self.usersCollectionRef.document(i).getDocument { (snap, error) in
                                if let error = error {
                                    print("Error getting documents \(error)")
                                } else {
                                    let itemName = snap!["name"] as? String ?? "No name"
                                    let itemDescription = snap!["description"] as? String ?? "No description"
                                    let itemDatePurchased = snap!["datePurchased"] as? String ?? "No date purchased"
                                    let itemSellBy = snap!["dateSellBy"] as? String ?? "No sell by date"
                                    let itemPrice = snap!["price"] as? String ?? "No price found"
                                    let userEmail = snap!["email"] as? String ?? "No email found"
                                    print(userEmail)
                                    completion(itemName, itemDescription, itemDatePurchased, itemSellBy, itemPrice, userEmail)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func getOrderInfo (_ orderCode : String, completion: @escaping (_ name: String,_ descript:String,_ datePurchased: String,_ sellBY: String,_ price:String, _ email:String  ) -> ()) {
        usersCollectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents \(error)")
            } else {
                for document in snapshot!.documents {
                    var orderCodes : [String] = []
                    orderCodes.append(document.documentID)
                    for i in orderCodes {
                        if i == orderCode {
                            self.usersCollectionRef.document(i).getDocument { (snap, error) in
                                if let error = error {
                                    print("Error getting documents \(error)")
                                } else {
                                    let itemName = snap!["name"] as? String ?? "No name"
                                    let itemDescription = snap!["description"] as? String ?? "No description"
                                    let itemDatePurchased = snap!["datePurchased"] as? String ?? "No date purchased"
                                    let itemSellBy = snap!["dateSellBy"] as? String ?? "No sell by date"
                                    let itemPrice = snap!["price"] as? String ?? "No price found"
                                    let userEmail = snap!["email"] as? String ?? "No email found"
                                    print(itemName)
                                    completion(itemName, itemDescription, itemDatePurchased, itemSellBy, itemPrice, userEmail)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func loadInformation (_ orderCode: String, completion: @escaping (_ name: String,_ descript:String,_ datePurchased: String,_ sellBY: String,_ price:String, _ email:String  )->()) {
           let db = Firestore.firestore()
           db.collection("PantryOrders").whereField("documentId", isEqualTo: orderCode).addSnapshotListener { (snapshot, error) in
               if let error = error {
                   print("Error getting documents", error)
               } else {
                   for document in snapshot!.documents {
                    let data = document.data()
                    let pName = data["name"] as? String ?? "no name"
                    let descript = data["description"] as? String ?? "no description"
                    let datePurch = data["datePurchased"] as? String ?? "no date purchased"
                    let dateSellBy = data["dateSellBy"] as? String ?? "no date sell by"
                    let price = data["price"] as? String ?? "no price"
                    let userAddress = data["address"] as? String ?? "no address"
                    let pdocID = document.documentID
                    let userEmail = data["email"] as? String ?? "no email"
//                    let newPantryAdd = PantryAdd(iName: pName, iDescription: descript, iDateP: datePurch, iDSellb: dateSellBy, iPrice: price, uAddress: userAddress, docID: pdocID, uEmail: userEmail)
//                    var tempPantryAdds = [PantryAdd]()
//                    tempPantryAdds.append(newPantryAdd)
//                    var tempPantryIds = [String]()
//                    for i in tempPantryAdds{
//                        tempPantryIds.append(i.email!)
//                    }
                    completion(pName, descript, datePurch, dateSellBy, price, userEmail)
                   }
               }
           }
       }
    
    func sendDataToDatabase () {
        let db = Firestore.firestore()
        db.collection("userOrders").addDocument(data: [
            "name": nameLabel.text!,
            "description": descriptionLabel.text!,
            "datePurchased": datePurchasedLabel.text!,
            "sellByDate": sellByDateLabel.text!,
            "price": priceLabel.text!,
            "email": emailLabel.text!,
            "fromEmail": UserDefaults.standard.string(forKey: "userEmail") ?? "No email",
            "orderCode": receivedOrderCode
        ])
    }
    
    @IBAction func interestBtnPressed(_ sender: Any) {
        let alertSuccess = UIAlertController(title: "Owner has been notified!", message: "The owner has been notified that you are interested in buying this item", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) ->Void in
        }
        alertSuccess.addAction(OKAction)
        let alert = UIAlertController(title: "Almost done!", message: "By pressing this button you are notifying the owner of the item that you want to buy it. Payment arrangments will be made later between you and the user.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { (action) in
            self.sendDataToDatabase()
        }))
        self.present(alert, animated: true, completion: nil)
        //sendDataToDatabase()
        self.present(alertSuccess, animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
