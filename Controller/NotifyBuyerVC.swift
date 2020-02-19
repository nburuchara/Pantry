//
//  NotifyBuyerVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 12/8/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import MessageUI

class NotifyBuyerVC: UIViewController, MFMailComposeViewControllerDelegate {

    
    var receivedEmail = ""
    
    
    @IBOutlet weak var buyerEmail: UILabel!
    
    @IBOutlet weak var paymentTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var contactBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        contactBtn.layer.cornerRadius = (contactBtn.frame.height/2)
        contactBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        Utilities.styleTextField(paymentTextField)
        Utilities.styleTextField(phoneNumTextField)
        
        buyerEmail.text = receivedEmail
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    func sendEmail() {
        
        if MFMailComposeViewController.canSendMail() {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            // Configure the fields of the interface.
            composeVC.setToRecipients(["\(buyerEmail.text!)"])
            composeVC.setSubject("Received your Order! Here's how you can get it :) ")
            composeVC.setMessageBody("Thanks for your order! \n\n Please contact me via email or via my number (if displayed) to arrange a pick up for your order. \n\n Preferred Payment Option: \(paymentTextField.text!) \n Enter your Venmo/CashApp Username:  \n\n Phone Number: \(phoneNumTextField.text ?? "Seller doesn't want to provide their number")", isHTML: false)
            // Present the view controller modally.
            present(composeVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController (title: "Alert", message: "Mail failed to send", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            print("Your device cannot send emails. Please configure an email address into Settings -> Mail, Contacts, Calendars.")
        }
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                                       didFinishWith result: MFMailComposeResult, error: Error?) {
        let alert = UIAlertController(title: "Message Sucessfully Sent", message: "The details you entered have been sent to the buyer!x", preferredStyle: .alert)
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
        controller.dismiss(animated: true, completion: nil)
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func contactBtnPressed(_ sender: Any) {
        sendEmail()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}
