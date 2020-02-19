/*
 
 -- When I log in - it will work however
 
*/

import UIKit
import Firebase

class SignUpVC: UIViewController {

    
    
    var usersCollectionRef: CollectionReference!
    let backgroundImgView = UIImageView()
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setUpBackground()
        
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.image = UIImage(named: "signUpBackground")
//        view.addSubview(imageView)
//        view.sendSubviewToBack(imageView)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
        passwdTextField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        fullNameTextField.attributedPlaceholder = NSAttributedString(string: "Full Name",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])

        usersCollectionRef = Firestore.firestore().collection("Users")
        signUpBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        signUpBtn.layer.cornerRadius = (signUpBtn.frame.height / 2)
        signUpBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        Utilities.styleTextField(fullNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwdTextField)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    
//    func setUpBackground () {
//        view.addSubview(backgroundImgView)
//        backgroundImgView.translatesAutoresizingMaskIntoConstraints = false // lets xcode know we're doing autolayouts
//        backgroundImgView.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 0).isActive = true // pinned the UIImageView to the top of the screen
//        backgroundImgView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 0).isActive = true
//        backgroundImgView.leadingAnchor.constraint(lessThanOrEqualTo: view.leadingAnchor, constant: 0).isActive = true
//        backgroundImgView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: 0).isActive = true
//        backgroundImgView.image = UIImage(named: "signUpBackground")
//        view.sendSubviewToBack(backgroundImgView)
//
//    }
    
//    func addBackgroundImage (imageName: String = "signUpBackground", contentMode: UIView.ContentMode = .scaleToFill) {
//        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImageView.image = UIImage(named: imageName)
//        backgroundImageView.contentMode = contentMode
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//        
//        // Adding NSLayout Constraints
//        
//        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
//        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
//        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
//        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
//        
//        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
//    
//        
//    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        createNewUser(withEmail: emailTextField.text!, password: passwdTextField.text!, username: fullNameTextField.text!)
        //dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func backToSignInBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func createNewUser(withEmail email: String, password: String, username: String) {
        let error = validateFields()
        if error != nil {
            // Present error message
            let alert = UIAlertController(title: "User sign up error", message: error, preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) ->Void in
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            
            // Create cleaned versions of the data fields
            let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwdTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let db = Firestore.firestore()
            // Create the new user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    let alert = UIAlertController(title: "User Authentication error",
                                                  message: err?.localizedDescription,
                                                  preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK",
                                                 style: .default) { (action: UIAlertAction!) -> Void in
                    }
                    alert.addAction(OKAction)
                    if let errCode = AuthErrorCode(rawValue: err!._code) {
                        switch errCode {
                        case .emailAlreadyInUse:
                            print("Email is already in use")
                        default:
                            print("Create User Error: \(error)")
                        }
                    }
                    self.present(alert, animated: true, completion: nil)
                } else { // User Signed up
                    // Create UIAlertController
                    let alert = UIAlertController(title: "User Authentication Error", message: "This email is already in use", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    
                    })
                    alert.addAction(okAction)
                    // Function for retreiving data from the database
                    self.usersCollectionRef.getDocuments { (snapshot, error) in
                        if let error = error {
                            print("Error getting documents: \(error)")
                        } else {
                            for document in snapshot!.documents {
                                //let docID = document.documentID
                                let userEmail = document.get("email") as! String
                                if self.emailTextField.text! == userEmail {
                                    // Present error
                                    self.present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                    }
                    db.collection("Users").addDocument(data: [
                        "email": email,
                        "fullname": fullName,
                        "uid": result!.user.uid
                        ], completion: { (error) in
                            if let error = error {
                                print(error.localizedDescription)
                                // Create alert to show me that there was a sign up issue
                                //db.collection("Error Messages").addDocument(data: ["errorMessages": error])
                            }
                    })
                    self.performSegue(withIdentifier: "signup_to_login", sender: nil)
                }
            }
        }
    }
        

    
    func validateFields () ->String? {

        //Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwdTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all the fields"
        }
        
        
        // Check if email is @stolaf.edu
        if !emailTextField.text!.contains("@stolaf.edu"){
            return "Please use your St. Olaf email"
        }
        
        
        // Check if password is secure
        let cleanedPassword = passwdTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
        
        if isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, & contains a special character and a number"
        }
        return nil
    }
    
    func isPasswordValid (_ password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}



