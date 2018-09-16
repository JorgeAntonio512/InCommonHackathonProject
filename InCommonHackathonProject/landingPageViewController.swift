//
//  landingPageViewController.swift
//  InCommonHackathonProject
//
//  Created by George Pazdral (work) on 9/15/18.
//  Copyright © 2018 George Pazdral (work). All rights reserved.
//

import Foundation
import UIKit

class landingPageViewController: UIViewController {
    
    @IBOutlet var visitOur: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(linkTapped(sender:)))
        self.visitOur.addGestureRecognizer(tapGestureRecognizer)
        self.visitOur.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkTapped(sender:UITapGestureRecognizer) {
        
        if let url = NSURL(string: "https://incommon.help/") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
}
