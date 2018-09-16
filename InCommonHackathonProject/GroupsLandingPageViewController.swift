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

class GroupsLandingPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let floaty = Floaty()
        floaty.addItem("Create new group", icon: UIImage(named: "download")!, handler: { item in
            self.performSegue(withIdentifier: "toCreate", sender: nil)
            floaty.close()
        })
        self.view.addSubview(floaty)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
