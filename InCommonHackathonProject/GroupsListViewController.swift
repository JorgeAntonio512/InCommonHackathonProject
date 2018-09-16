//
//  GroupsListViewController.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/16/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import Foundation
import Firebase
import UIKit
import Floaty

class GroupsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
     var usersArray = [ [String: Any] ]()
    @IBOutlet var groupsList:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         let ref = Database.database().reference().child("groups").child("topics")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if ( snapshot.value is NSNull ) {
                print("not found")
            } else {
                
                
                
                for child in (snapshot.children) {
                    
                    let snap = child as! DataSnapshot //each child is a snapshot
                    
                    let dict = snap.value as? [String:AnyObject] // the value is a dict
                    
                    let key = snap.key
                    self.usersArray.append(dict!)
                    print(self.usersArray)
                    self.keyArray.append(key)
                }
                self.tableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
