//
//  createAgroupViewController.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/16/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import Foundation
import Firebase
import UIKit
import Floaty

class createAgroupViewController: UIViewController {
    
    @IBOutlet var chooseAtopic:UITextField!
    @IBOutlet var buttonzForDayz:UIView!
    
    var ref: DatabaseReference!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(linkzTapz(sender:)))
        self.buttonzForDayz.addGestureRecognizer(tapGestureRecognizer)
        self.buttonzForDayz.isUserInteractionEnabled = true
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkzTapz(sender:UITapGestureRecognizer) {
    self.ref.child("groups").childByAutoId().setValue(["topic": chooseAtopic.text])
        print("great success!")
        self.performSegue(withIdentifier: "toGroupsView", sender: nil)
    }
    
}
