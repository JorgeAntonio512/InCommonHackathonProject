//
//  FirstViewController.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/15/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class loginViewController: UIViewController {

    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var loginBttn: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(linkTappedzzz(sender:)))
        self.loginBttn.addGestureRecognizer(tapGestureRecognizer)
        self.loginBttn.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkTappedzzz(sender:UITapGestureRecognizer) {

        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
    if let error = error {
    print(error.localizedDescription)
        print("Please provide a valid email address & password combo!")
        let alertController = UIAlertController(title: "Incorrect email address & password combo", message: "Please provide a valid email address & password combo!", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Close", style: .default) { (action:UIAlertAction) in
            print("You've pressed default");
        }
        alertController.addAction(action1)
        self.present(alertController, animated: true, completion: nil)
    }
    else if let user = user {
    print(user)
        self.performSegue(withIdentifier: "fromLoginToGroups", sender: nil)
    }
    }
    }
}

