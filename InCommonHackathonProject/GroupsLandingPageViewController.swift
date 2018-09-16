//
//  GroupsLandingPage.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/16/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import Foundation
import UIKit
import Floaty
import Firebase

class GroupsLandingPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let userDict = self.usersArray[indexPath.row]
        
        cell.textLabel?.text = userDict["topic"] as? String
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let codde = 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = self.usersArray[indexPath.row]
        
        topic = dict["topic"] as? String
        
        self.performSegue(withIdentifier: "toTopicz", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toPeoplesProfiles") {
            let vc = segue.destination as! topicsLandingPageViewController
            vc.value = topic!
            
        }
    }
    
    
    var usersArray = [ [String: Any] ]()
    @IBOutlet var groupsList:UITableView!
    var topic:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let floaty = Floaty()
        floaty.addItem("Create new topic", icon: UIImage(named: "download")!, handler: { item in
            self.performSegue(withIdentifier: "toCreate", sender: nil)
            floaty.close()
        })
        self.view.addSubview(floaty)
        
        
        self.title = "Topics"
        // Do any additional setup after loading the view, typically from a nib.
        
        groupsList.delegate = self
        groupsList.dataSource = self
        
        definesPresentationContext = true
        //tableView.tableHeaderView = searchController.searchBar
        
        self.groupsList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        let ref = Database.database().reference().child("groups")//.child("topic")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if ( snapshot.value is NSNull ) {
                print("not found")
            } else {
                
                
                
                for child in (snapshot.children) {
                    print("you are here..")
                    let snap = child as! DataSnapshot //each child is a snapshot
                    
                    let dict = snap.value as? [String:AnyObject] // the value is a dict
                    
                    let key = snap.key
                    self.usersArray.append(dict!)
                    print(self.usersArray)
                    print("hi there :)")
                }
                self.groupsList.reloadData()
            }
        })
    }
    }


