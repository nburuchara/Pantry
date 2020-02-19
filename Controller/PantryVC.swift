//
//  PantryVC.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/28/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit

class NewItemVC: UIViewController {

    
    

    
    @IBOutlet weak var uploadBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        uploadBtn.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        uploadBtn.layer.cornerRadius = (uploadBtn.frame.height/2)
        uploadBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        uploadItem()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func validateFields () ->String? {
        
        //Check that all fields are filled in
//        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || descripTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || dateTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || priceTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//            return "Please fill in all the fields"
//        }
        
        return nil
    }
    
    
    func uploadItem () {
        let error = validateFields()
        if error != nil {
            
        } else {
            let alert = UIAlertController(title: "Oops something isn't right", message: error, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) ->Void in
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
