//
//  MainOptionsPage.swift
//  onTheGo
//
//  Created by Norman Buruchara on 11/12/19.
//  Copyright © 2019 Norman B. All rights reserved.
//

import UIKit
import Firebase

class MainOptionsPage: UIViewController  {

    var usersCollectionRef: CollectionReference!
    var receivedUserName: String = ""
    var receivedUserEmail: String = ""
    
    @IBOutlet weak var commPantryBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var myPantryBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersCollectionRef = Firestore.firestore().collection("Users")
        getCurrentUserEmail { (email) in
            UserDefaults.standard.set(email, forKey: "userEmail")
        }
        
        
//        let imageView = UIImageView(frame: view.bounds)
//        imageView.image = UIImage(named: "pineapple")
//        view.addSubview(imageView)
//        view.sendSubviewToBack(imageView)
        

        
        myPantryBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        myPantryBtn.layer.cornerRadius = (myPantryBtn.frame.height/2)
        myPantryBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        logoutBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        logoutBtn.layer.cornerRadius = (logoutBtn.frame.height/2)
        logoutBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        commPantryBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        commPantryBtn.layer.cornerRadius = (commPantryBtn.frame.height/2)
        commPantryBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
//        ordersBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
//        ordersBtn.layer.cornerRadius = (ordersBtn.frame.height/2)
//        ordersBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        sellBtn.backgroundColor = #colorLiteral(red: 0.8117647059, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        sellBtn.layer.cornerRadius = (sellBtn.frame.height/2)
        sellBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
    }
    

    func getCurrentUserEmail (completion: @escaping (_ email: String) -> ()) {
        if Auth.auth().currentUser != nil {
            guard let email = Auth.auth().currentUser?.email else {return}
            usersCollectionRef.document(email).getDocument { (snapshot, error) in
                if let error = error {
                    debugPrint("Error retreiving from database", error)
                } else {
                    completion(snapshot!.documentID)
                }
            }
        }
    }
    
    
    

    @IBAction func logoutBtnPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutEror as NSError{
            print("Error signing out: ", signOutEror)
        }
        print("Successfully signed out")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func commPantryPressed(_ sender: Any) {
        performSegue(withIdentifier: "commSeg", sender: self)
    }
    

    @IBAction func myPantryBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "pantrySeg", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let barVC = segue.destination as? UITabBarController {
            barVC.viewControllers?.forEach({ (NewItemVC) in
                if let nextVC = NewItemVC as? NewItemVC {
                    // send code to New Item (Name?)
                }
            })
            barVC.viewControllers?.forEach({ (ListPantryVC) in
                if let nextVC = ListPantryVC as? ListPantryVC {
                    // send code to ListPantryVC (Name?)
                }
            })
        }
    }
    
}
