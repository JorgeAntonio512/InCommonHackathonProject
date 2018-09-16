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
                if (password.text?.count)! >= 6 {
                    if isValidEmail(testStr: email.text!){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let user = user {
                print(user)
            }
                }
    
    
    }
    else {
    print("Please provide a valid email address")
    let alertController = UIAlertController(title: "Email address is not valid", message: "Please provide a valid email address!", preferredStyle: .alert)
    
    let action1 = UIAlertAction(title: "Close", style: .default) { (action:UIAlertAction) in
    print("You've pressed default");
    }
    alertController.addAction(action1)
    self.present(alertController, animated: true, completion: nil)
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

    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result
    }
}

