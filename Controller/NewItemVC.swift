//
//  NewItemVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/2/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class NewItemVC: UIViewController, MFMailComposeViewControllerDelegate {

    
    var usersCollectionRef: CollectionReference!
    
    var emailCalled : String = ""
    var pantryAdditions : [PantryAdd] = []

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descripTextField: UITextField!
    @IBOutlet weak var datePurchTextField: UITextField!
    @IBOutlet weak var dateSellBTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //var composeVC = MFMailComposeViewController!
    
    @IBOutlet weak var uploadBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        uploadBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        uploadBtn.layer.cornerRadius = (uploadBtn.frame.height/2)
        uploadBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        Utilities.styleTextField(nameTextField)
        Utilities.styleTextField(descripTextField)
        Utilities.styleTextField(datePurchTextField)
        Utilities.styleTextField(dateSellBTextField)
        Utilities.styleTextField(priceTextField)
        Utilities.styleTextField(addressTextField)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            let alert = UIAlertController(title: "Oops something went wrong", message: "Please fill in all fields", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) -> Void in
            }
            alert.addAction(OKAction)
            present(alert, animated: true, completion: nil)
        } else {
            // - - - SAVE DATA IN APP - - -
            // Order of operations
            // 1. return the newly added item
            // 2. append it to the array
            // 3. save the array as with codable
            
            // 1)
//            let receivedItem = latestAdditionObject()
//            // 2)
//            pantryAdditions.append(receivedItem)
            // 3)
            
            //receivedPantryAdds.append(latestAdditionObject())
            
            sendDataToDatabase()
            sendEmail()
            clearTextFields()
        }
    }
    
    func clearTextFields () {
        nameTextField.text = ""
        descripTextField.text = ""
        datePurchTextField.text = ""
        dateSellBTextField.text = ""
        priceTextField.text = ""
        addressTextField.text = ""
    }
    
    
    func validateFields () -> String? {
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || descripTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || datePurchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            dateSellBTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            priceTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        return nil
    }
    
//    func latestAdditionObject () -> PantryAdd {
//        let oneItem = PantryAdd(iName: nameTextField.text!, iDescription: descripTextField.text!, iDateP: datePurchTextField.text!, iDSellb: dateSellBTextField.text!, iPrice: priceTextField.text!, uAddress: addressTextField.text!)
//        return oneItem
//    }
    
    
//    func save () {
//    
//        let jsonEncoder = JSONEncoder()
//        if let savedData = try? jsonEncoder.encode(pantryAdditions) {
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: "pantryAdds")
//        } else{
//            print("Failed to save new adds")
//        }
//        
//    }
    
    func canSendText() -> Bool {
        return MFMessageComposeViewController.canSendText()
    }
    
    func sendEmail() {
        // Present the view controller modally.
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            // Configure the fields of the interface.
            composeVC.setToRecipients(["pantrycomp@gmail.com"])
            composeVC.setSubject("Send Item for Review")
            composeVC.setMessageBody("Please confirm the information below is correct: \n\n Item information : \n\n Item Name: \(nameTextField.text!) \n Item Description: \(descripTextField.text!) \n Date Purchased: \(datePurchTextField.text!) \n Date Sell By: \(dateSellBTextField.text!) \n Price: $\(priceTextField.text!) \n Address: \(addressTextField.text!) \n\n PLEASE ATTACH A PHOTO OF YOUR ITEM BELOW (tap and hold the anywhere below then press the arrow and select the to \"Insert Photo or Video\"):", isHTML: false)
            present(composeVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController (title: "Alert", message: "Mail failed to send", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            print("Your device cannot send emails. Please configure an email address into Settings -> Mail, Contacts, Calendars.")
        }
        //self.present(composeVC, animated: true, completion: nil)
        //mailComposeController(composeVC, didFinishWith: MFMailComposeResult, error: Error?)
    }
    
//    func mailComposeController(controller: MFMailComposeViewController,
//                                       didFinishWithResult result: MFMailComposeResult, error: NSError?) {
//        // Check the result or perform other tasks.
//        var resultMess = ""
//        switch result.rawValue {
//        case MFMailComposeResult.cancelled.rawValue:
//            resultMess = "Mail cancelled"
//        case MFMailComposeResult.saved.rawValue:
//            resultMess = "Mail saved"
//        case MFMailComposeResult.sent.rawValue:
//            resultMess = "Thanks for contacting us!\nWe'll get back to you asap."
//        case MFMailComposeResult.failed.rawValue:
//            resultMess = "Something went wrong with sending Mail, try again later."
//        default:break
//        }
//
//        // Dismiss the mail compose view controller.
//        print(resultMess)
//        controller.dismiss(animated: true, completion: nil)
//    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        let alert = UIAlertController(title: "Message Successfully Sent", message: "Your details have been sent for review!", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) ->Void in
        }
        alert.addAction(OKAction)
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue :
            print("Cancelled")
        case MFMailComposeResult.failed.rawValue :
            print("Failed")
        case MFMailComposeResult.saved.rawValue :
            print("Saved")
        case MFMailComposeResult.sent.rawValue :
            print("Sent")
        default: break
        }
        //self.present(alert, animated: true, completion: nil)
        controller.dismiss(animated: true, completion: nil)
        self.present(alert, animated: true, completion: nil)
    }
    

    
    func sendDataToDatabase () {
        let db = Firestore.firestore()
        db.collection("PantryOrders").addDocument(data: [
            "name": nameTextField.text!,
            "description": descripTextField.text!,
            "datePurchased": datePurchTextField.text!,
            "dateSellBy": dateSellBTextField.text!,
            "price": priceTextField.text!,
            "address": addressTextField.text!,
            "email": UserDefaults.standard.string(forKey: "userEmail")!
        ])
    }
    
    
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
