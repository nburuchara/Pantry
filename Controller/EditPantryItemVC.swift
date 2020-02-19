//
//  EditPantryItemVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 1/5/20.
//  Copyright © 2020 Norman B. All rights reserved.
//

import UIKit
import Firebase

protocol dataSentBackFast {
    func fieldsSentBack (docID: String, name: String, descript: String, price: String)
}

class EditPantryItemVC: UIViewController {

    var delegate: dataSentBackFast?
    
    var receivedDocID = ""
    var receivedName = ""
    var receivedDescription = ""
    var receivedDatePurchased = ""
    var receivedSellByDate = ""
    var receivedPrice = ""
    
    @IBOutlet weak var makeChangesBtn: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptTextField: UITextField!
    @IBOutlet weak var dateBTextField: UITextField!
    @IBOutlet weak var sellBTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    var usersCollectionRef: CollectionReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersCollectionRef = Firestore.firestore().collection("PantryOrders")
        
        makeChangesBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        makeChangesBtn.layer.cornerRadius = (makeChangesBtn.frame.height/2)
        makeChangesBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        nameTextField.text = receivedName
        descriptTextField.text = receivedDescription
        dateBTextField.text = receivedDatePurchased
        sellBTextField.text = receivedSellByDate
        priceTextField.text = receivedPrice
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func modifyData (_ documentId: String) {
        usersCollectionRef.document(documentId).updateData([
            "name": nameTextField.text!,
            "price": priceTextField.text!,
            "datePurchased": dateBTextField.text!,
            "description": descriptTextField.text!,
            "dateSellBy": sellBTextField.text!
        ])
        
    }
    
    
    
    @IBAction func changesBtnPressed(_ sender: Any) {
        modifyData(receivedDocID)
        dismiss(animated: true, completion: nil)
        delegate?.fieldsSentBack(docID: receivedDocID, name: nameTextField.text!, descript: descriptTextField.text!, price: priceTextField.text!)
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
