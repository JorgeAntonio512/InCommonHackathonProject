//
//  topicsLandingPage.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/16/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import Foundation
import UIKit
import WebKit
import Firebase
import FirebaseStorage
import KMPlaceholderTextView

class topicsLandingPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leaveAComment: KMPlaceholderTextView!
    @IBOutlet weak var commentBtn: UIView!
    
    @IBOutlet var topiczz: UITextView!
    var value = ""
        
        override func viewDidLoad() {
            super.viewDidLoad()
        print(value + "hey dur")
    topiczz.text = value
    }
        
        

            
            
            
        }
