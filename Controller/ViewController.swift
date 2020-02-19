//
//  ViewController.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/5/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import Firebase



class ViewController: UIViewController  {
    

    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var usersCollectionRef: CollectionReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersCollectionRef = Firestore.firestore().collection("Users")
        checkIfUserIsSignedIn()
        
       
        
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.image = UIImage(named: "soupSpoon")
//        view.addSubview(imageView)
//        view.sendSubviewToBack(imageView)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        
        signInBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        signInBtn.layer.cornerRadius = (signInBtn.frame.height / 2)
        signInBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        
        signUpBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        signUpBtn.layer.cornerRadius = (signUpBtn.frame.height / 2)
        signUpBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    


    
    override func viewWillDisappear(_ animated: Bool) {
        //Auth.auth().removeStateDidChangeListener(handler!)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        logInUser(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "login_to_signup", sender: self)
    }
    
    
    func logInUser (email: String, password: String) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                let alert = UIAlertController(title: "Oops something went wrong",
                                              message: error?.localizedDescription,
                                              preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK",
                                             style: .default) { (action: UIAlertAction!) -> Void in
                }
                let resetPasswordAction = UIAlertAction(title: "Reset Password",
                                                        style: .default) { (action: UIAlertAction!) -> Void in
                }
                alert.addAction(OKAction)
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .missingEmail:
                        print("Please enter your email")
                    case .wrongPassword:
                        print("Password seems to be incorrect. Try again.")
                    case .invalidEmail:
                        print("Invalid email")
                    case .emailAlreadyInUse:
                        print("Email is already in use")
                    default:
                        print("Create User Error: \(error)")
                    }
                }
                self.present(alert, animated: true, completion: nil)
            } else { // User Logged in
                self.performSegue(withIdentifier: "login_to_app", sender: self)
            }
        }
        // Validate the textfields:
        
        
}
    

    
    private func checkIfUserIsSignedIn() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                return
            } else {
                guard let email = Auth.auth().currentUser?.email else {return}
                self.usersCollectionRef.document(email).getDocument(completion: { (snapshot, error) in
                    if let error = error {
                        print("Error retrieving from database", error)
                    } else {
                        print(snapshot!.documentID)
                    }
                })
                self.performSegue(withIdentifier: "login_to_app", sender: self)
            }
        }
    }
    
    func getCurrentUserEmail () {
        if Auth.auth().currentUser != nil {
            guard let email = Auth.auth().currentUser?.email else {return}
            usersCollectionRef.document(email).getDocument { (snapshot, error) in
                if let error = error {
                    print("Error retreiving from database", error)
                } else {
                    print(snapshot!.documentID)
                }
            }
        }
    }
    
    func validateFields () ->String? {
        
        //Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the fields"
        }
        
        // Check if password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        if isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, & contains a special character and a number"
        }
        return nil
    }
    
    func isPasswordValid (_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login_to_app" {
            
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

