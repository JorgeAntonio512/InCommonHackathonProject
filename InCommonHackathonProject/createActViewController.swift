//
//  SecondViewController.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/15/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class createActViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var button: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(linkTappedz(sender:)))
        self.button.addGestureRecognizer(tapGestureRecognizer)
        self.button.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkTappedz(sender:UITapGestureRecognizer) {
        
        if username.text != "" {
            
            if email.text != "" {
                if (password.text?.count)! > 6 {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let user = user {
                print(user)
            }
                }}
                else {
                    print("Please provide a valid password")
                    let alertController = UIAlertController(title: "Password is too short", message: "Password must be at least 6 characters!", preferredStyle: .alert)
                    
                    let action1 = UIAlertAction(title: "Close", style: .default) { (action:UIAlertAction) in
                        print("You've pressed default");
                    }
                    alertController.addAction(action1)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            else {
                print("Please provide a valid email")
                let alertController = UIAlertController(title: "No email provided", message: "Please provide a valid email!", preferredStyle: .alert)
                
                let action1 = UIAlertAction(title: "Close", style: .default) { (action:UIAlertAction) in
                    print("You've pressed default");
                }
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        else {
            print("Please provide a first name or nickname")
            let alertController = UIAlertController(title: "No first name or nickname provided", message: "Please provide a first name or nickname!", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "Close", style: .default) { (action:UIAlertAction) in
                print("You've pressed default");
            }
                alertController.addAction(action1)
                self.present(alertController, animated: true, completion: nil)
        }
    }


}

